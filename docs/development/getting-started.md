---
sidebar_position: 1
title: Development Setup Guide
description: Complete guide to set up your development environment and get started with the project.
---

# Development Setup Guide

Welcome to the development team! This guide will help you set up your development environment and get started with the project.

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

### Required Software
- **Node.js**: Version 18.x or higher
- **npm**: Version 9.x or higher (comes with Node.js)
- **Git**: Version 2.30 or higher
- **Docker**: Version 20.x or higher
- **Docker Compose**: Version 2.x or higher

### Required Accounts
- **GitHub**: For code repository access and documentation hosting
- **Azure**: For cloud services, Key Vault, and infrastructure
- **1Password**: For credential management (global rule)
- **Centrex AI**: For project-specific resources and team access

### Development Tools (Recommended)
- **VS Code**: With recommended extensions
- **Postman**: For API testing
- **DBeaver**: For database management

## 🚀 Quick Start

Follow these steps to get up and running quickly:

```bash
# 1. Clone the repository
git clone https://github.com/your-org/your-project.git
cd your-project

# 2. Install dependencies
npm install

# 3. Set up environment variables
cp .env.example .env.development

# 4. Start the development environment
npm run dev:setup

# 5. Start the application
npm run dev
```

## 📝 Detailed Setup Instructions

### Step 1: Repository Setup

#### Clone the Repository
```bash
git clone https://github.com/your-org/your-project.git
cd your-project
```

#### Configure Git
```bash
# Set up your Git identity
git config user.name "Your Name"
git config user.email "your.email@company.com"

# Set up SSH key (if not already done)
ssh-keygen -t ed25519 -C "your.email@company.com"
```

### Step 2: Environment Configuration

#### Create Environment Files
```bash
# Copy the example environment file
cp .env.example .env.development

# Copy additional environment files
cp .env.example .env.test
cp .env.example .env.local
```

#### Configure Environment Variables
Edit `.env.development` with your local settings:

```env
# Database Configuration
DATABASE_URL=postgresql://username:password@localhost:5432/your_project_dev
REDIS_URL=redis://localhost:6379

# API Configuration
API_PORT=3000
API_HOST=localhost

# Authentication
JWT_SECRET=your-jwt-secret-here
JWT_REFRESH_SECRET=your-refresh-secret-here

# External Services
AZURE_STORAGE_CONNECTION_STRING=your-azure-connection-string
SENDGRID_API_KEY=your-sendgrid-key

# Development Settings
NODE_ENV=development
LOG_LEVEL=debug
```

#### Retrieve Secrets from Azure Key Vault
```bash
# Install Azure CLI (if not already installed)
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Retrieve secrets
export DATABASE_PASSWORD=$(az keyvault secret show --vault-name your-keyvault --name database-password --query value -o tsv)
export JWT_SECRET=$(az keyvault secret show --vault-name your-keyvault --name jwt-secret --query value -o tsv)
```

### Step 3: Database Setup

#### Start Local Database with Docker
```bash
# Start PostgreSQL and Redis
docker-compose up -d postgres redis

# Wait for services to be ready
docker-compose logs -f postgres
```

#### Run Database Migrations
```bash
# Run migrations
npm run db:migrate

# Seed development data
npm run db:seed
```

#### Verify Database Connection
```bash
# Test database connection
npm run db:test-connection

# View database schema
npm run db:schema
```

### Step 4: Application Setup

#### Install Dependencies
```bash
# Install all dependencies
npm install

# Install development dependencies
npm install --only=dev
```

#### Build the Application
```bash
# Build TypeScript
npm run build

# Build frontend assets
npm run build:frontend
```

#### Start Development Server
```bash
# Start all services
npm run dev

# Or start individual services
npm run dev:api      # API server only
npm run dev:frontend # Frontend only
npm run dev:worker   # Background workers
```

### Step 5: Verification

#### Check Application Health
```bash
# Health check endpoint
curl http://localhost:3000/health

# API documentation
open http://localhost:3000/api-docs
```

#### Run Tests
```bash
# Run all tests
npm test

# Run specific test suites
npm run test:unit
npm run test:integration
npm run test:e2e
```

#### Check Code Quality
```bash
# Lint code
npm run lint

# Format code
npm run format

# Type check
npm run type-check
```

## 🛠️ Development Workflow

### Daily Development Process

#### 1. Start Your Day
```bash
# Pull latest changes
git pull origin main

# Update dependencies
npm install

# Start development environment
npm run dev
```

#### 2. Create a Feature Branch
```bash
# Create and switch to new branch
git checkout -b feature/your-feature-name

# Or use our helper script
npm run git:create-branch feature/your-feature-name
```

#### 3. Make Changes
- Write code following our [coding standards](/docs/development/coding-standards)
- Write tests for new functionality
- Update documentation as needed

#### 4. Test Your Changes
```bash
# Run tests
npm test

# Check code quality
npm run lint
npm run type-check

# Test manually
npm run dev
```

#### 5. Commit and Push
```bash
# Stage changes
git add .

# Commit with conventional commit message
git commit -m "feat: add user authentication endpoint"

# Push to remote
git push origin feature/your-feature-name
```

### Code Review Process

#### Before Submitting PR
- [ ] All tests pass
- [ ] Code follows style guidelines
- [ ] Documentation is updated
- [ ] No console.log statements
- [ ] No TODO comments (or they're documented)

#### PR Template
Use our PR template when creating pull requests:
- Description of changes
- Testing instructions
- Screenshots (if UI changes)
- Breaking changes (if any)

## 🐛 Troubleshooting

### Common Issues

#### Port Already in Use
```bash
# Find process using port 3000
lsof -ti:3000

# Kill the process
kill -9 $(lsof -ti:3000)

# Or use a different port
PORT=3001 npm run dev
```

#### Database Connection Issues
```bash
# Check if PostgreSQL is running
docker-compose ps postgres

# Restart database
docker-compose restart postgres

# Check database logs
docker-compose logs postgres
```

#### Node Modules Issues
```bash
# Clear npm cache
npm cache clean --force

# Delete node_modules and reinstall
rm -rf node_modules package-lock.json
npm install
```

#### Environment Variable Issues
```bash
# Check if .env file exists
ls -la .env.development

# Verify environment variables are loaded
npm run env:check
```

### Getting Help

#### Internal Resources
- **Slack**: #dev-help channel
- **Wiki**: Internal development wiki
- **Code Review**: Ask for help in PR comments

#### External Resources
- **Documentation**: This documentation site
- **Stack Overflow**: For general programming questions
- **GitHub Issues**: For project-specific issues

## 📚 Next Steps

### Learn the Codebase
1. **Read the [Architecture Overview](/docs/architecture/overview)**
2. **Review [Coding Standards](/docs/development/coding-standards)**
3. **Explore the [API Documentation](/docs/api/overview)**
4. **Check out [Testing Guidelines](/docs/development/testing)**

### Start Contributing
1. **Pick up a "good first issue"** from our issue tracker
2. **Join our daily standup** meetings
3. **Participate in code reviews**
4. **Ask questions** - we're here to help!

### Advanced Setup
- **IDE Configuration**: [VS Code Setup Guide](/docs/development/ide-setup)
- **Debugging**: [Debugging Guide](/docs/development/debugging)
- **Performance**: [Performance Testing](/docs/development/performance)

---

*Need help? Reach out to the development team on Slack or create an issue in our repository.*
