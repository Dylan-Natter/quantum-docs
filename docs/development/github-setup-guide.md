# GitHub Setup Guide for Quantum Platform

<!-- Last updated: $(date) - Testing automation -->
<!-- 🚀 AUTOMATION TEST #2: Full flow demonstration -->
<!-- ✅ COMPREHENSIVE TEST: 100% Automated Flow - $(date) -->
<!-- 🎉 FINAL TEST: Guardrails Fixed - $(date) -->
<!-- 🏆 FINAL RETEST: Complete Automation Working - $(date) -->

## Prerequisites

1. **GitHub Account**: You need a GitHub account
2. **SSH Key**: Set up SSH key for authentication (recommended)
3. **Organization**: Consider creating a GitHub organization for the project

## Step-by-Step Setup

### 1. Create GitHub Repository

#### Option A: Using GitHub Web Interface (Recommended)
1. Go to [GitHub.com](https://github.com) and sign in
2. Click the "+" icon in the top right corner
3. Select "New repository"
4. Fill in the details:
   - **Repository name**: `quantum-platform`
   - **Description**: `Quantum Platform - Enterprise-grade development platform`
   - **Visibility**: Private (recommended for platform development)
   - **Initialize**: Do NOT initialize with README, .gitignore, or license (we already have these)
5. Click "Create repository"

#### Option B: Using GitHub CLI (if installed)
```bash
gh repo create quantum-platform --private --description "Quantum Platform - Enterprise-grade development platform"
```

### 2. Set Up SSH Authentication (Recommended)

#### Check if you have SSH keys:
```bash
ls -la ~/.ssh
```

#### If no SSH keys exist, create them:
```bash
ssh-keygen -t ed25519 -C "your-email@example.com"
# Press Enter to accept default file location
# Enter a passphrase (optional but recommended)
```

#### Add SSH key to GitHub:
```bash
# Copy your public key
cat ~/.ssh/id_ed25519.pub
```

1. Go to GitHub Settings → SSH and GPG keys
2. Click "New SSH key"
3. Paste your public key
4. Give it a title (e.g., "Quantum Platform Development")
5. Click "Add SSH key"

#### Test SSH connection:
```bash
ssh -T git@github.com
```

### 3. Connect Local Repository to GitHub

Once you have the repository URL from GitHub, run these commands:

```bash
cd /home/dnatter/quantum

# Add GitHub as remote origin (replace with your actual repository URL)
git remote add origin git@github.com:YOUR_USERNAME/quantum-platform.git

# Verify remote is added
git remote -v

# Push main branch
git checkout main
git push -u origin main

# Push develop branch
git checkout develop
git push -u origin develop

# Push current feature branch
git checkout feature/QUANTUM-001-setup-git-workflow
git push -u origin feature/QUANTUM-001-setup-git-workflow
```

### 4. Set Up Branch Protection Rules

#### For Main Branch:
1. Go to your repository on GitHub
2. Click Settings → Branches
3. Click "Add rule"
4. Configure:
   - **Branch name pattern**: `main`
   - ✅ Require a pull request before merging
   - ✅ Require approvals: 2
   - ✅ Dismiss stale PR approvals when new commits are pushed
   - ✅ Require status checks to pass before merging
   - ✅ Require branches to be up to date before merging
   - ✅ Restrict pushes that create files larger than 100MB

#### For Develop Branch:
1. Add another rule for `develop`
2. Configure:
   - **Branch name pattern**: `develop`
   - ✅ Require a pull request before merging
   - ✅ Require approvals: 1
   - ✅ Require status checks to pass before merging

### 5. Set Up GitHub Actions (CI/CD)

Create the workflow file:

```bash
mkdir -p .github/workflows
```

The workflow file is already created at `.github/workflows/guardrails.yml`

### 6. Configure Repository Settings

#### General Settings:
1. Go to Settings → General
2. Enable "Issues" and "Projects"
3. Set up "Discussions" if needed
4. Configure "Pages" for documentation hosting

#### Security Settings:
1. Go to Settings → Security
2. Enable "Dependency graph"
3. Enable "Dependabot alerts"
4. Enable "Dependabot security updates"
5. Enable "Code scanning" (GitHub Advanced Security if available)

### 7. Set Up Team Access (if using organization)

1. Go to Settings → Manage access
2. Add team members with appropriate permissions:
   - **Admin**: Platform architects
   - **Maintain**: Platform team leads
   - **Write**: Development team members
   - **Read**: Stakeholders and observers

### 8. Create Issue and PR Templates

#### Issue Template:
```bash
mkdir -p .github/ISSUE_TEMPLATE
```

Create `.github/ISSUE_TEMPLATE/bug_report.md`:
```markdown
---
name: Bug report
about: Create a report to help us improve
title: '[BUG] '
labels: bug
assignees: ''
---

**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

**Expected behavior**
A clear and concise description of what you expected to happen.

**Screenshots**
If applicable, add screenshots to help explain your problem.

**Environment:**
 - OS: [e.g. Ubuntu 20.04]
 - Version: [e.g. v1.2.0]
 - Browser: [e.g. chrome, safari]

**Additional context**
Add any other context about the problem here.
```

#### PR Template:
Create `.github/pull_request_template.md`:
```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update

## How Has This Been Tested?
- [ ] Unit tests pass
- [ ] Integration tests pass
- [ ] Manual testing completed

## Checklist
- [ ] My code follows the style guidelines of this project
- [ ] I have performed a self-review of my own code
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] I have made corresponding changes to the documentation
- [ ] My changes generate no new warnings
- [ ] I have added tests that prove my fix is effective or that my feature works
- [ ] New and existing unit tests pass locally with my changes
- [ ] Any dependent changes have been merged and published

## Screenshots (if applicable)
Add screenshots to help explain your changes.

## Additional Notes
Add any additional notes about the changes here.
```

### 9. Set Up Repository Secrets

Go to Settings → Secrets and variables → Actions and add:

- `AZURE_CLIENT_ID`
- `AZURE_CLIENT_SECRET`
- `AZURE_TENANT_ID`
- `AZURE_SUBSCRIPTION_ID`
- Any other environment-specific secrets

### 10. Verify Setup

Run these commands to verify everything is working:

```bash
# Check remote configuration
git remote -v

# Check branch status
git branch -a

# Test workflow script
./scripts/git-workflow.sh status

# Create a test feature branch
./scripts/git-workflow.sh feature test-github-integration

# Make a small change and commit
echo "# Test GitHub Integration" >> README.md
git add README.md
git commit -m "test: verify GitHub integration"

# Push the test branch
git push origin feature/test-github-integration
```

## Troubleshooting

### SSH Key Issues
```bash
# Test SSH connection
ssh -T git@github.com

# If permission denied, check SSH agent
ssh-add -l

# Add key to SSH agent
ssh-add ~/.ssh/id_ed25519
```

### Remote URL Issues
```bash
# Check current remote
git remote -v

# Update remote URL if needed
git remote set-url origin git@github.com:YOUR_USERNAME/quantum-platform.git
```

### Permission Issues
- Ensure you have write access to the repository
- Check if you're using the correct SSH key
- Verify your GitHub account has the necessary permissions

## Next Steps After Setup

1. **Create your first Pull Request** from the feature branch to develop
2. **Set up automated testing** in GitHub Actions
3. **Configure deployment pipelines** for staging and production
4. **Set up monitoring and alerting** for the repository
5. **Train team members** on the Git workflow

## Support

If you encounter issues:
1. Check the GitHub documentation
2. Review the Git workflow guide in `docs/development/git-workflow.md`
3. Ask for help in team channels
4. Escalate to platform architects for complex issues
