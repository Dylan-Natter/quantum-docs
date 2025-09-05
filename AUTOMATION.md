# 🤖 Automated Documentation Flow

This document describes the automated documentation system for the Quantum Platform.

## 📋 Overview

The documentation system automatically syncs content from the `quantum-platform` repository to the `quantum-docs` repository and deploys it to `docs.quantum.centrex.ai`.

## 🏗️ Architecture

```
quantum-platform (source) → quantum-docs (deployed)
     ↓                           ↓
  /docs/ folder              Docusaurus site
     ↓                           ↓
  Manual/CI sync            Auto-deploy to docs.quantum.centrex.ai
```

## 🔄 Automation Methods

### 1. Manual Sync (Local Development)

**From quantum-platform repo:**
```bash
cd /home/dnatter/quantum
./scripts/update-docs.sh
```

**From docs-website repo:**
```bash
cd /home/dnatter/docs-website
./sync-docs.sh
```

### 2. GitHub Actions (Automatic)

**Triggered by:**
- Push to `main` branch in `quantum-platform` (when `/docs/` changes)
- Push to `main` branch in `quantum-docs` (when `/docs/` changes)
- Manual workflow dispatch
- Scheduled sync every 6 hours

## 📁 File Structure

### quantum-platform repository:
```
quantum/
├── docs/                    # Source documentation
│   ├── blueprint/
│   ├── development/
│   └── snippets/
├── scripts/
│   └── update-docs.sh      # Manual sync script
└── .github/workflows/
    └── update-docs.yml     # Auto-sync workflow
```

### quantum-docs repository:
```
docs-website/
├── docs/                   # Synced documentation
├── src/                    # Docusaurus source
├── static/                 # Static assets
├── sync-docs.sh           # Manual sync script
├── .github/workflows/
│   └── sync-and-deploy.yml # Auto-deploy workflow
└── docusaurus.config.ts   # Docusaurus configuration
```

## 🚀 Deployment Flow

1. **Documentation Update**: Developer updates docs in `quantum-platform/docs/`
2. **Commit & Push**: Changes are committed to `quantum-platform`
3. **Auto-Sync**: GitHub Action syncs docs to `quantum-docs`
4. **Auto-Deploy**: GitHub Pages automatically deploys the updated site
5. **Live Site**: Documentation is available at `docs.quantum.centrex.ai`

## ⚙️ Configuration

### GitHub Actions Secrets
- `GITHUB_TOKEN`: Automatically provided by GitHub

### Cloudflare API Token
- Stored in: `~/.cloudflare_token`
- Used for: DNS management (if needed)

## 🛠️ Manual Operations

### Sync Documentation
```bash
# From quantum repo
cd /home/dnatter/quantum
./scripts/update-docs.sh

# From docs repo
cd /home/dnatter/docs-website
./sync-docs.sh
```

### Check Sync Status
```bash
# Check if docs are up to date
cd /home/dnatter/docs-website
git status
git log --oneline -5
```

### Force Rebuild
```bash
cd /home/dnatter/docs-website
npm run build
git add .
git commit -m "docs: force rebuild"
git push origin main
```

## 🔍 Troubleshooting

### Common Issues

1. **Sync Script Fails**
   - Check git status in both repos
   - Ensure no uncommitted changes
   - Verify repository permissions

2. **GitHub Actions Fail**
   - Check workflow logs in GitHub
   - Verify repository secrets
   - Ensure both repos are accessible

3. **Site Not Updating**
   - Check GitHub Pages deployment status
   - Verify DNS configuration
   - Check Cloudflare settings

### Debug Commands
```bash
# Check git status
cd /home/dnatter/quantum && git status
cd /home/dnatter/docs-website && git status

# Check sync script
cd /home/dnatter/docs-website && ./sync-docs.sh

# Check site status
curl -I https://docs.quantum.centrex.ai
```

## 📊 Monitoring

### GitHub Actions
- Monitor workflows in both repositories
- Check for failed runs and errors
- Review deployment logs

### Site Health
- Regular checks of `docs.quantum.centrex.ai`
- Monitor SSL certificate status
- Check DNS propagation

## 🔐 Security

- API tokens stored securely
- Repository access controlled via GitHub
- Automated deployments use GitHub Actions
- No sensitive data in documentation

## 📈 Future Enhancements

- [ ] Add documentation validation
- [ ] Implement preview deployments for PRs
- [ ] Add search functionality
- [ ] Set up monitoring and alerts
- [ ] Add documentation analytics
