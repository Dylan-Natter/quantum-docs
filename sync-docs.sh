#!/bin/bash

# Automated Documentation Sync Script
# Syncs documentation from quantum-platform repo to quantum-docs repo

set -e

# Configuration
QUANTUM_REPO="/home/dnatter/quantum"
DOCS_REPO="/home/dnatter/docs-website"
BACKUP_DIR="/tmp/docs-backup-$(date +%Y%m%d-%H%M%S)"

echo "🔄 Starting automated documentation sync..."

# Create backup of current docs
echo "📦 Creating backup of current documentation..."
mkdir -p "$BACKUP_DIR"
cp -r "$DOCS_REPO/docs" "$BACKUP_DIR/docs-backup" 2>/dev/null || echo "No existing docs to backup"

# Sync documentation from quantum repo
echo "📋 Syncing documentation from quantum-platform..."
cd "$QUANTUM_REPO"

# Pull latest changes
git config pull.rebase false
git pull origin main

# Copy docs to docs-website
echo "📁 Copying documentation files..."
rsync -av --delete \
    --exclude='.git' \
    --exclude='node_modules' \
    --exclude='*.log' \
    "$QUANTUM_REPO/docs/" "$DOCS_REPO/docs/"

# Update Docusaurus configuration if needed
echo "⚙️  Updating Docusaurus configuration..."
cd "$DOCS_REPO"

# Check if there are changes
if git diff --quiet; then
    echo "✅ No changes detected. Documentation is up to date."
    exit 0
fi

# Commit and push changes
echo "💾 Committing documentation changes..."
git add docs/
git commit -m "docs: sync documentation from quantum-platform

- Auto-synced from quantum-platform repo
- Timestamp: $(date)
- Source: $(cd "$QUANTUM_REPO" && git rev-parse HEAD)"

echo "🚀 Pushing changes to GitHub..."
git push origin main

echo "✅ Documentation sync completed successfully!"
echo "🌐 Site will be updated at: https://docs.quantum.centrex.ai"
echo "📊 Backup created at: $BACKUP_DIR"
