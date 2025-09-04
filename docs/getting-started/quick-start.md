---
sidebar_position: 1
title: Quick Start
description: Get up and running with Quantum Platform in minutes
---

# Quick Start Guide

Welcome to Quantum Platform! This guide will help you get up and running in just a few minutes.

## What You'll Build

In this quick start, you'll:
1. Set up your development environment
2. Create your first intent
3. Execute a simple workflow
4. Monitor the results

## Prerequisites

Before you begin, ensure you have:
- **Node.js** 18+ installed
- **Python** 3.10+ installed
- **Docker** and **Docker Compose** installed
- **Git** installed

## Step 1: Clone the Repository

```bash
git clone https://github.com/centrex-ai/quantum-platform.git
cd quantum-platform
```

## Step 2: Start the Development Environment

The Quantum Platform includes a complete local development environment with all necessary services.

```bash
# Start all services
make up

# Wait for services to be ready
sleep 10

# Check service status
docker compose -f infra/local/docker-compose.yml ps
```

You should see:
- **PostgreSQL** running on port 5432
- **Redis** running on port 6379
- **API Gateway** running on port 8000
- **Web Application** running on port 3000

## Step 3: Access the Platform

Open your browser and navigate to:
- **Web Application**: [http://localhost:3000](http://localhost:3000)
- **API Documentation**: [http://localhost:8000/api/v1/docs](http://localhost:8000/api/v1/docs)

## Step 4: Create Your First Intent

Let's create a simple intent that sends a welcome email to new users.

### Using the Web Interface

1. Navigate to [http://localhost:3000](http://localhost:3000)
2. Click "Create Intent"
3. Fill in the intent details:
   - **Name**: `welcome-email`
   - **Description**: `Send welcome email to new users`
4. Define the workflow steps:
   ```json
   {
     "type": "workflow",
     "description": "Send welcome email to new users",
     "steps": [
       {
         "id": "send-welcome-email",
         "module": "email-service",
         "parameters": {
           "to": "{{user.email}}",
           "subject": "Welcome to Quantum Platform!",
           "template": "welcome",
           "data": {
             "name": "{{user.name}}",
             "platform": "Quantum Platform"
           }
         }
       }
     ]
   }
   ```
5. Click "Save Intent"

### Using the API

```bash
# Create intent via API
curl -X POST "http://localhost:8000/api/v1/intents" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer your-jwt-token" \
  -d '{
    "name": "welcome-email",
    "definition": {
      "type": "workflow",
      "description": "Send welcome email to new users",
      "steps": [
        {
          "id": "send-welcome-email",
          "module": "email-service",
          "parameters": {
            "to": "{{user.email}}",
            "subject": "Welcome to Quantum Platform!",
            "template": "welcome",
            "data": {
              "name": "{{user.name}}",
              "platform": "Quantum Platform"
            }
          }
        }
      ]
    }
  }'
```

## Step 5: Execute the Workflow

Now let's execute the intent with some test data.

### Using the Web Interface

1. Navigate to the "Workflows" section
2. Click "Execute Workflow"
3. Select the `welcome-email` intent
4. Provide test data:
   ```json
   {
     "user": {
       "email": "john@example.com",
       "name": "John Doe"
     }
   }
   ```
5. Click "Execute"

### Using the API

```bash
# Execute workflow via API
curl -X POST "http://localhost:8000/api/v1/workflows" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer your-jwt-token" \
  -d '{
    "intent_id": "your-intent-id",
    "parameters": {
      "user": {
        "email": "john@example.com",
        "name": "John Doe"
      }
    }
  }'
```

## Step 6: Monitor the Execution

### Using the Web Interface

1. Navigate to the "Workflows" section
2. Find your workflow execution
3. Click on it to see detailed execution steps
4. Monitor the progress in real-time

### Using the API

```bash
# Get workflow status
curl -X GET "http://localhost:8000/api/v1/workflows/your-workflow-id" \
  -H "Authorization: Bearer your-jwt-token"
```

## Step 7: Explore the Platform

Now that you have a working intent, explore the platform:

### Intent Management
- **List Intents**: View all your intents
- **Version Control**: Manage intent versions
- **Validation**: Validate intent definitions
- **Testing**: Test intents with sample data

### Workflow Monitoring
- **Execution History**: View past executions
- **Real-time Status**: Monitor running workflows
- **Error Handling**: Debug failed executions
- **Performance Metrics**: Track execution times

### Module Development
- **Create Modules**: Build custom business logic
- **Register Capabilities**: Define module capabilities
- **Health Monitoring**: Monitor module health
- **Configuration**: Manage module settings

## Next Steps

Congratulations! You've successfully created and executed your first intent. Here's what to explore next:

### 1. Learn More About Intents
- [Architecture Overview](/docs/architecture/overview)
- [Application Blueprint](/docs/blueprints/application-blueprint)
- [API Reference](/docs/api-reference/overview)

### 2. Explore Advanced Features
- [Design System](/docs/blueprints/design-system)
- [Development Guidelines](/docs/development/git-workflow)
- [Blueprint Context](/docs/blueprint/context)

### 3. Deploy to Production
- [Build Steps](/docs/blueprint/build_steps)
- [Decision Records](/docs/blueprint/decision_records/ADR-0000-template)
- [Architect Preamble](/docs/snippets/architect_preamble)

### 4. Join the Community
- [GitHub Repository](https://github.com/centrex-ai/quantum-platform)
- [Documentation Issues](https://github.com/centrex-ai/quantum-platform-docs/issues)
- [Project Discussions](https://github.com/centrex-ai/quantum-platform/discussions)

## Troubleshooting

### Common Issues

**Services not starting:**
```bash
# Check Docker status
docker ps

# Restart services
make down
make up
```

**Database connection issues:**
```bash
# Check database logs
docker logs quantum-postgres

# Reset database
make clean
make up
```

**API authentication errors:**
- Ensure you have a valid JWT token
- Check the token expiration time
- Verify the token has the required permissions

### Getting Help

If you run into issues:
1. Check the [Development Guidelines](/docs/development/git-workflow)
2. Search [GitHub Issues](https://github.com/centrex-ai/quantum-platform/issues)
3. Review the [Architecture Overview](/docs/architecture/overview)
4. Create a [GitHub Issue](https://github.com/centrex-ai/quantum-platform/issues/new)

## What's Next?

You're now ready to start building with Quantum Platform! The platform is designed to scale with your needs, from simple automation scripts to complex enterprise workflows.

### Key Concepts to Learn

1. **Intents**: Declarative specifications of what you want to achieve
2. **Workflows**: Orchestrated sequences of operations
3. **Modules**: Pluggable business logic components
4. **Tenants**: Isolated environments for different organizations
5. **Events**: Asynchronous messaging and notifications

### Recommended Learning Path

1. **Start Simple**: Begin with basic intents and workflows
2. **Add Complexity**: Gradually add more sophisticated logic
3. **Scale Up**: Implement multi-tenant and enterprise features
4. **Optimize**: Focus on performance and reliability
5. **Deploy**: Move to production with confidence

---

*Ready to transform your organization's approach to system orchestration? Let's build something amazing together!* 🚀
