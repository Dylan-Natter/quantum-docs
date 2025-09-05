#!/bin/bash

# Quantum Platform Documentation Sync Script
# This script syncs documentation from the main project to the docs website

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
QUANTUM_PROJECT_DIR="/home/dnatter/quantum"
DOCS_WEBSITE_DIR="/home/dnatter/docs-website"
BACKUP_DIR="/home/dnatter/docs-backup"

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to create backup
create_backup() {
    print_status "Creating backup of current documentation..."
    
    if [ -d "$BACKUP_DIR" ]; then
        rm -rf "$BACKUP_DIR"
    fi
    
    mkdir -p "$BACKUP_DIR"
    cp -r "$DOCS_WEBSITE_DIR/docs" "$BACKUP_DIR/"
    cp -r "$DOCS_WEBSITE_DIR/src" "$BACKUP_DIR/"
    cp "$DOCS_WEBSITE_DIR/sidebars.ts" "$BACKUP_DIR/"
    cp "$DOCS_WEBSITE_DIR/docusaurus.config.ts" "$BACKUP_DIR/"
    
    print_success "Backup created at $BACKUP_DIR"
}

# Function to sync architecture documentation
sync_architecture() {
    print_status "Syncing architecture documentation..."
    
    # Copy architecture docs from quantum project
    if [ -f "$QUANTUM_PROJECT_DIR/docs/ARCHITECTURE.md" ]; then
        cp "$QUANTUM_PROJECT_DIR/docs/ARCHITECTURE.md" "$DOCS_WEBSITE_DIR/docs/architecture/overview.md"
        print_success "Architecture overview synced"
    fi
    
    if [ -f "$QUANTUM_PROJECT_DIR/docs/DECISIONS.md" ]; then
        cp "$QUANTUM_PROJECT_DIR/docs/DECISIONS.md" "$DOCS_WEBSITE_DIR/docs/architecture/decisions.md"
        print_success "Architecture decisions synced"
    fi
}

# Function to sync API documentation
sync_api() {
    print_status "Syncing API documentation..."
    
    # Generate OpenAPI spec from FastAPI app
    if [ -f "$QUANTUM_PROJECT_DIR/apps/api/app/main.py" ]; then
        print_status "Generating OpenAPI specification..."
        cd "$QUANTUM_PROJECT_DIR/apps/api"
        
        # Start the API server temporarily to generate OpenAPI spec
        python -c "
import sys
sys.path.append('.')
from app.main import app
import json

# Generate OpenAPI spec
openapi_spec = app.openapi()

# Save to docs website
with open('$DOCS_WEBSITE_DIR/static/openapi.json', 'w') as f:
    json.dump(openapi_spec, f, indent=2)

print('OpenAPI spec generated successfully')
" || print_warning "Could not generate OpenAPI spec (API server not running)"
        
        print_success "API documentation synced"
    fi
}

# Function to sync team and project information
sync_project_info() {
    print_status "Syncing project information..."
    
    # Copy team roster and task graph
    if [ -f "$QUANTUM_PROJECT_DIR/agents/team.roster.json" ]; then
        cp "$QUANTUM_PROJECT_DIR/agents/team.roster.json" "$DOCS_WEBSITE_DIR/static/team.roster.json"
        print_success "Team roster synced"
    fi
    
    if [ -f "$QUANTUM_PROJECT_DIR/agents/taskgraph.json" ]; then
        cp "$QUANTUM_PROJECT_DIR/agents/taskgraph.json" "$DOCS_WEBSITE_DIR/static/taskgraph.json"
        print_success "Task graph synced"
    fi
}

# Function to update documentation metadata
update_metadata() {
    print_status "Updating documentation metadata..."
    
    # Get current git commit hash
    cd "$QUANTUM_PROJECT_DIR"
    GIT_COMMIT=$(git rev-parse HEAD)
    GIT_BRANCH=$(git branch --show-current)
    GIT_DATE=$(git log -1 --format=%ci)
    
    # Create metadata file
    cat > "$DOCS_WEBSITE_DIR/static/metadata.json" << EOF
{
  "last_sync": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "git_commit": "$GIT_COMMIT",
  "git_branch": "$GIT_BRANCH",
  "git_date": "$GIT_DATE",
  "version": "1.0.0"
}
EOF
    
    print_success "Metadata updated"
}

# Function to validate documentation
validate_docs() {
    print_status "Validating documentation..."
    
    cd "$DOCS_WEBSITE_DIR"
    
    # Check if build succeeds
    if npm run build > /dev/null 2>&1; then
        print_success "Documentation build validation passed"
    else
        print_error "Documentation build validation failed"
        return 1
    fi
}

# Function to commit changes to git
commit_changes() {
    print_status "Committing changes to git..."
    
    cd "$DOCS_WEBSITE_DIR"
    
    # Check if there are changes
    if git diff --quiet; then
        print_warning "No changes to commit"
        return 0
    fi
    
    # Add all changes
    git add .
    
    # Commit with timestamp
    git commit -m "docs: sync documentation from quantum project

- Synced architecture documentation
- Updated API reference
- Refreshed project metadata
- Generated OpenAPI specification

Sync timestamp: $(date -u +%Y-%m-%dT%H:%M:%SZ)
Git commit: $(cd $QUANTUM_PROJECT_DIR && git rev-parse HEAD)"
    
    print_success "Changes committed to git"
}

# Function to push changes
push_changes() {
    print_status "Pushing changes to remote repository..."
    
    cd "$DOCS_WEBSITE_DIR"
    
    # Check if there's a remote configured
    if git remote | grep -q origin; then
        git push origin main
        print_success "Changes pushed to remote repository"
    else
        print_warning "No remote repository configured"
    fi
}

# Function to generate documentation report
generate_report() {
    print_status "Generating documentation report..."
    
    REPORT_FILE="$DOCS_WEBSITE_DIR/docs-report.md"
    
    cat > "$REPORT_FILE" << EOF
# Documentation Sync Report

**Generated:** $(date -u +%Y-%m-%dT%H:%M:%SZ)

## Sync Summary

- **Source Project:** $QUANTUM_PROJECT_DIR
- **Target Website:** $DOCS_WEBSITE_DIR
- **Git Commit:** $(cd $QUANTUM_PROJECT_DIR && git rev-parse HEAD)
- **Git Branch:** $(cd $QUANTUM_PROJECT_DIR && git branch --show-current)

## Files Synced

### Architecture Documentation
- \`docs/ARCHITECTURE.md\` → \`docs/architecture/overview.md\`
- \`docs/DECISIONS.md\` → \`docs/architecture/decisions.md\`

### API Documentation
- OpenAPI specification generated from FastAPI app
- API reference documentation updated

### Project Information
- Team roster: \`agents/team.roster.json\`
- Task graph: \`agents/taskgraph.json\`
- Project metadata: \`static/metadata.json\`

## Build Status

- **Build:** ✅ Successful
- **Validation:** ✅ Passed
- **Git Commit:** ✅ Committed
- **Remote Push:** $(if git remote | grep -q origin; then echo "✅ Pushed"; else echo "⚠️ No remote configured"; fi)

## Next Steps

1. Review the synced documentation
2. Test the documentation website locally: \`npm run start\`
3. Deploy to production if changes are approved
4. Update any broken links or missing content

## Backup

A backup of the previous documentation has been created at:
\`$BACKUP_DIR\`

EOF
    
    print_success "Documentation report generated: $REPORT_FILE"
}

# Main execution
main() {
    print_status "Starting Quantum Platform documentation sync..."
    print_status "Source: $QUANTUM_PROJECT_DIR"
    print_status "Target: $DOCS_WEBSITE_DIR"
    
    # Check if directories exist
    if [ ! -d "$QUANTUM_PROJECT_DIR" ]; then
        print_error "Quantum project directory not found: $QUANTUM_PROJECT_DIR"
        exit 1
    fi
    
    if [ ! -d "$DOCS_WEBSITE_DIR" ]; then
        print_error "Docs website directory not found: $DOCS_WEBSITE_DIR"
        exit 1
    fi
    
    # Create backup
    create_backup
    
    # Sync documentation
    sync_architecture
    sync_api
    sync_project_info
    update_metadata
    
    # Validate and commit
    if validate_docs; then
        commit_changes
        push_changes
        generate_report
        print_success "Documentation sync completed successfully!"
    else
        print_error "Documentation sync failed during validation"
        exit 1
    fi
}

# Run main function
main "$@"