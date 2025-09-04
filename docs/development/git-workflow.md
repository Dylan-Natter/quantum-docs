# Git Workflow and Branching Strategy

## Overview

This document outlines the Git workflow and branching strategy for the Quantum Platform development.

## Branch Structure

### Main Branches

- **`main`** - Production-ready code, always deployable
- **`develop`** - Integration branch for features, staging environment

### Supporting Branches

- **`feature/*`** - New features and enhancements
- **`bugfix/*`** - Bug fixes for the current release
- **`hotfix/*`** - Critical fixes for production
- **`release/*`** - Release preparation and stabilization

## Branch Naming Conventions

### Feature Branches
```
feature/QUANTUM-123-add-user-authentication
feature/QUANTUM-456-implement-api-gateway
```

### Bug Fix Branches
```
bugfix/QUANTUM-789-fix-login-validation
bugfix/QUANTUM-101-fix-database-connection
```

### Hotfix Branches
```
hotfix/QUANTUM-202-security-patch
hotfix/QUANTUM-303-critical-bug-fix
```

### Release Branches
```
release/v1.2.0
release/v2.0.0-beta
```

## Workflow Process

### 1. Feature Development

1. **Create feature branch from develop:**
   ```bash
   git checkout develop
   git pull origin develop
   git checkout -b feature/QUANTUM-123-add-user-authentication
   ```

2. **Develop and commit:**
   ```bash
   git add .
   git commit -m "feat: add user authentication module"
   ```

3. **Push and create PR:**
   ```bash
   git push origin feature/QUANTUM-123-add-user-authentication
   ```

4. **Create Pull Request to `develop`**

### 2. Bug Fixes

1. **Create bugfix branch from develop:**
   ```bash
   git checkout develop
   git pull origin develop
   git checkout -b bugfix/QUANTUM-789-fix-login-validation
   ```

2. **Fix and commit:**
   ```bash
   git add .
   git commit -m "fix: resolve login validation issue"
   ```

3. **Push and create PR to `develop`**

### 3. Release Process

1. **Create release branch from develop:**
   ```bash
   git checkout develop
   git pull origin develop
   git checkout -b release/v1.2.0
   ```

2. **Update version numbers and changelog**

3. **Merge to main and develop:**
   ```bash
   git checkout main
   git merge release/v1.2.0
   git tag v1.2.0
   git checkout develop
   git merge release/v1.2.0
   ```

### 4. Hotfix Process

1. **Create hotfix branch from main:**
   ```bash
   git checkout main
   git pull origin main
   git checkout -b hotfix/QUANTUM-202-security-patch
   ```

2. **Fix and commit:**
   ```bash
   git add .
   git commit -m "hotfix: apply security patch"
   ```

3. **Merge to main and develop:**
   ```bash
   git checkout main
   git merge hotfix/QUANTUM-202-security-patch
   git tag v1.2.1
   git checkout develop
   git merge hotfix/QUANTUM-202-security-patch
   ```

## Commit Message Convention

We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests or correcting existing tests
- **chore**: Changes to the build process or auxiliary tools

### Examples

```
feat(auth): add OAuth2 integration
fix(api): resolve database connection timeout
docs: update API documentation
refactor(ui): simplify component structure
```

## Branch Protection Rules

### Main Branch Protection

- Require pull request reviews (2 reviewers minimum)
- Require status checks to pass
- Require branches to be up to date
- Restrict pushes to main branch
- Require linear history

### Develop Branch Protection

- Require pull request reviews (1 reviewer minimum)
- Require status checks to pass
- Allow force pushes for maintainers

## Pre-commit Hooks

The repository includes pre-commit hooks that enforce:

- **Intent Reference Headers**: All source files must include `intent_ref` headers
- **Linting**: Python (flake8) and JavaScript/TypeScript (ESLint) linting
- **Security Checks**: Detection of hardcoded secrets and SQL injection patterns
- **ADR Requirements**: Changes to context.md require Architecture Decision Records

## Code Review Process

### Pull Request Requirements

1. **Description**: Clear description of changes and motivation
2. **Testing**: Evidence of testing (unit tests, integration tests)
3. **Documentation**: Updated documentation if needed
4. **Breaking Changes**: Clearly marked if applicable
5. **ADR**: Architecture Decision Record for significant changes

### Review Checklist

- [ ] Code follows project conventions
- [ ] Tests are included and passing
- [ ] Documentation is updated
- [ ] No hardcoded secrets or credentials
- [ ] Security implications considered
- [ ] Performance impact assessed
- [ ] Breaking changes documented

## Environment Branches

- **`main`** → Production environment
- **`develop`** → Staging environment
- **`feature/*`** → Development environment (per feature)

## Emergency Procedures

### Critical Bug in Production

1. Create hotfix branch from main
2. Implement minimal fix
3. Test thoroughly
4. Merge to main and tag
5. Deploy immediately
6. Merge back to develop

### Rollback Procedure

1. Identify last known good commit
2. Create rollback branch
3. Revert problematic changes
4. Test rollback
5. Deploy rollback
6. Create follow-up issue for proper fix

## Best Practices

1. **Keep branches small and focused**
2. **Commit frequently with meaningful messages**
3. **Always pull latest changes before starting work**
4. **Use feature flags for incomplete features**
5. **Write tests before implementing features**
6. **Document breaking changes**
7. **Use semantic versioning for releases**
8. **Keep main branch always deployable**

## Tools and Automation

- **GitHub Actions**: CI/CD pipeline
- **Pre-commit hooks**: Code quality enforcement
- **Branch protection**: Automated branch rules
- **Dependabot**: Dependency updates
- **Code scanning**: Security vulnerability detection

## Getting Help

- Review this document first
- Check existing issues and PRs
- Ask in team channels for guidance
- Escalate to platform architects for architectural decisions
