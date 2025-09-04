---
sidebar_position: 1
title: API Reference
description: Complete API reference for the Quantum Platform
---

# API Reference

The Quantum Platform provides a comprehensive REST API for managing intents, workflows, and system resources. This reference covers all available endpoints, request/response formats, and authentication methods.

## Base URL

```
https://api.quantum.centrex.ai/api/v1
```

## Authentication

All API requests require authentication using JWT tokens obtained through Azure Active Directory.

### Authentication Header

```http
Authorization: Bearer <your-jwt-token>
```

### Getting an Access Token

```bash
# Using Azure CLI
az account get-access-token --resource https://api.quantum.centrex.ai

# Using curl
curl -X POST "https://login.microsoftonline.com/{tenant-id}/oauth2/v2.0/token" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "client_id={client-id}&client_secret={client-secret}&scope=https://api.quantum.centrex.ai/.default&grant_type=client_credentials"
```

## Rate Limiting

API requests are rate limited to ensure fair usage and system stability.

- **Rate Limit**: 1000 requests per hour per user
- **Burst Limit**: 100 requests per minute
- **Headers**: Rate limit information is included in response headers

```http
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1640995200
```

## Error Handling

The API uses standard HTTP status codes and returns detailed error information in JSON format.

### Error Response Format

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "The request data is invalid",
    "details": [
      {
        "field": "name",
        "message": "Name is required"
      }
    ],
    "request_id": "req_1234567890",
    "timestamp": "2024-01-04T12:00:00Z"
  }
}
```

### Common Error Codes

| Code | Status | Description |
|------|--------|-------------|
| `VALIDATION_ERROR` | 400 | Request data validation failed |
| `UNAUTHORIZED` | 401 | Authentication required |
| `FORBIDDEN` | 403 | Insufficient permissions |
| `NOT_FOUND` | 404 | Resource not found |
| `CONFLICT` | 409 | Resource already exists |
| `RATE_LIMITED` | 429 | Rate limit exceeded |
| `INTERNAL_ERROR` | 500 | Internal server error |

## Pagination

List endpoints support pagination using cursor-based pagination for better performance with large datasets.

### Pagination Parameters

- `limit`: Number of items per page (default: 20, max: 100)
- `cursor`: Cursor for pagination (returned in response)

### Pagination Response

```json
{
  "data": [...],
  "pagination": {
    "limit": 20,
    "has_more": true,
    "next_cursor": "eyJpZCI6IjEyMzQ1Njc4LTkwYWItY2RlZi0xMjM0LTU2Nzg5MGFiY2RlZiJ9",
    "total": 150
  }
}
```

## API Endpoints

### Intents

Manage intent definitions and versions.

#### List Intents

```http
GET /intents
```

**Query Parameters:**
- `status` (optional): Filter by status (`draft`, `active`, `deprecated`, `archived`)
- `limit` (optional): Number of items per page (default: 20)
- `cursor` (optional): Pagination cursor

**Response:**
```json
{
  "data": [
    {
      "id": "12345678-90ab-cdef-1234-567890abcdef",
      "tenant_id": "87654321-fedc-ba09-8765-4321fedcba09",
      "name": "user-onboarding",
      "version": 1,
      "definition": {
        "type": "workflow",
        "steps": [...]
      },
      "status": "active",
      "created_at": "2024-01-04T12:00:00Z",
      "updated_at": "2024-01-04T12:00:00Z",
      "created_by": "user@example.com",
      "updated_by": "user@example.com"
    }
  ],
  "pagination": {
    "limit": 20,
    "has_more": false,
    "next_cursor": null,
    "total": 1
  }
}
```

#### Get Intent

```http
GET /intents/{intent_id}
```

**Path Parameters:**
- `intent_id`: UUID of the intent

**Response:**
```json
{
  "id": "12345678-90ab-cdef-1234-567890abcdef",
  "tenant_id": "87654321-fedc-ba09-8765-4321fedcba09",
  "name": "user-onboarding",
  "version": 1,
  "definition": {
    "type": "workflow",
    "description": "Automated user onboarding workflow",
    "steps": [
      {
        "id": "create-user",
        "module": "user-management",
        "parameters": {
          "email": "{{user.email}}",
          "name": "{{user.name}}"
        }
      },
      {
        "id": "send-welcome-email",
        "module": "email-service",
        "parameters": {
          "to": "{{user.email}}",
          "template": "welcome"
        },
        "depends_on": ["create-user"]
      }
    ]
  },
  "status": "active",
  "created_at": "2024-01-04T12:00:00Z",
  "updated_at": "2024-01-04T12:00:00Z",
  "created_by": "user@example.com",
  "updated_by": "user@example.com"
}
```

#### Create Intent

```http
POST /intents
```

**Request Body:**
```json
{
  "name": "user-onboarding",
  "definition": {
    "type": "workflow",
    "description": "Automated user onboarding workflow",
    "steps": [
      {
        "id": "create-user",
        "module": "user-management",
        "parameters": {
          "email": "{{user.email}}",
          "name": "{{user.name}}"
        }
      }
    ]
  }
}
```

**Response:**
```json
{
  "id": "12345678-90ab-cdef-1234-567890abcdef",
  "tenant_id": "87654321-fedc-ba09-8765-4321fedcba09",
  "name": "user-onboarding",
  "version": 1,
  "definition": {
    "type": "workflow",
    "description": "Automated user onboarding workflow",
    "steps": [
      {
        "id": "create-user",
        "module": "user-management",
        "parameters": {
          "email": "{{user.email}}",
          "name": "{{user.name}}"
        }
      }
    ]
  },
  "status": "draft",
  "created_at": "2024-01-04T12:00:00Z",
  "updated_at": "2024-01-04T12:00:00Z",
  "created_by": "user@example.com",
  "updated_by": "user@example.com"
}
```

#### Update Intent

```http
PUT /intents/{intent_id}
```

**Path Parameters:**
- `intent_id`: UUID of the intent

**Request Body:**
```json
{
  "definition": {
    "type": "workflow",
    "description": "Updated user onboarding workflow",
    "steps": [
      {
        "id": "create-user",
        "module": "user-management",
        "parameters": {
          "email": "{{user.email}}",
          "name": "{{user.name}}"
        }
      },
      {
        "id": "send-welcome-email",
        "module": "email-service",
        "parameters": {
          "to": "{{user.email}}",
          "template": "welcome"
        },
        "depends_on": ["create-user"]
      }
    ]
  }
}
```

#### Delete Intent

```http
DELETE /intents/{intent_id}
```

**Path Parameters:**
- `intent_id`: UUID of the intent

**Response:**
```json
{
  "message": "Intent deleted successfully"
}
```

### Workflows

Manage workflow executions and monitoring.

#### List Workflows

```http
GET /workflows
```

**Query Parameters:**
- `intent_id` (optional): Filter by intent ID
- `status` (optional): Filter by status (`pending`, `running`, `completed`, `failed`)
- `limit` (optional): Number of items per page (default: 20)
- `cursor` (optional): Pagination cursor

**Response:**
```json
{
  "data": [
    {
      "id": "87654321-fedc-ba09-8765-4321fedcba09",
      "intent_id": "12345678-90ab-cdef-1234-567890abcdef",
      "status": "completed",
      "started_at": "2024-01-04T12:00:00Z",
      "completed_at": "2024-01-04T12:05:00Z",
      "error_message": null,
      "created_at": "2024-01-04T12:00:00Z"
    }
  ],
  "pagination": {
    "limit": 20,
    "has_more": false,
    "next_cursor": null,
    "total": 1
  }
}
```

#### Get Workflow

```http
GET /workflows/{workflow_id}
```

**Path Parameters:**
- `workflow_id`: UUID of the workflow

**Response:**
```json
{
  "id": "87654321-fedc-ba09-8765-4321fedcba09",
  "intent_id": "12345678-90ab-cdef-1234-567890abcdef",
  "status": "completed",
  "steps": [
    {
      "id": "create-user",
      "status": "completed",
      "started_at": "2024-01-04T12:00:00Z",
      "completed_at": "2024-01-04T12:01:00Z",
      "error_message": null
    },
    {
      "id": "send-welcome-email",
      "status": "completed",
      "started_at": "2024-01-04T12:01:00Z",
      "completed_at": "2024-01-04T12:02:00Z",
      "error_message": null
    }
  ],
  "started_at": "2024-01-04T12:00:00Z",
  "completed_at": "2024-01-04T12:05:00Z",
  "error_message": null,
  "created_at": "2024-01-04T12:00:00Z"
}
```

#### Execute Workflow

```http
POST /workflows
```

**Request Body:**
```json
{
  "intent_id": "12345678-90ab-cdef-1234-567890abcdef",
  "parameters": {
    "user": {
      "email": "john@example.com",
      "name": "John Doe"
    }
  }
}
```

**Response:**
```json
{
  "id": "87654321-fedc-ba09-8765-4321fedcba09",
  "intent_id": "12345678-90ab-cdef-1234-567890abcdef",
  "status": "pending",
  "started_at": null,
  "completed_at": null,
  "error_message": null,
  "created_at": "2024-01-04T12:00:00Z"
}
```

### Modules

Manage module registrations and capabilities.

#### List Modules

```http
GET /modules
```

**Query Parameters:**
- `status` (optional): Filter by status (`active`, `inactive`, `deprecated`)
- `limit` (optional): Number of items per page (default: 20)
- `cursor` (optional): Pagination cursor

**Response:**
```json
{
  "data": [
    {
      "id": "11111111-2222-3333-4444-555555555555",
      "tenant_id": "87654321-fedc-ba09-8765-4321fedcba09",
      "name": "user-management",
      "version": "1.0.0",
      "capabilities": [
        {
          "name": "create-user",
          "description": "Create a new user account",
          "parameters": {
            "email": "string",
            "name": "string"
          }
        }
      ],
      "status": "active",
      "created_at": "2024-01-04T12:00:00Z",
      "updated_at": "2024-01-04T12:00:00Z"
    }
  ],
  "pagination": {
    "limit": 20,
    "has_more": false,
    "next_cursor": null,
    "total": 1
  }
}
```

#### Register Module

```http
POST /modules
```

**Request Body:**
```json
{
  "name": "user-management",
  "version": "1.0.0",
  "capabilities": [
    {
      "name": "create-user",
      "description": "Create a new user account",
      "parameters": {
        "email": "string",
        "name": "string"
      }
    }
  ]
}
```

### Health Check

Check system health and status.

#### Health Check

```http
GET /health
```

**Response:**
```json
{
  "status": "ok",
  "version": "1.0.0",
  "timestamp": "2024-01-04T12:00:00Z",
  "services": {
    "database": "ok",
    "redis": "ok",
    "event_hub": "ok"
  }
}
```

## SDKs and Libraries

### Python SDK

```bash
pip install quantum-platform-sdk
```

```python
from quantum_platform import QuantumClient

# Initialize client
client = QuantumClient(
    base_url="https://api.quantum.centrex.ai/api/v1",
    access_token="your-jwt-token"
)

# Create intent
intent = client.intents.create(
    name="user-onboarding",
    definition={
        "type": "workflow",
        "steps": [...]
    }
)

# Execute workflow
workflow = client.workflows.execute(
    intent_id=intent.id,
    parameters={"user": {"email": "john@example.com"}}
)
```

### JavaScript SDK

```bash
npm install @quantum-platform/sdk
```

```javascript
import { QuantumClient } from '@quantum-platform/sdk';

// Initialize client
const client = new QuantumClient({
  baseUrl: 'https://api.quantum.centrex.ai/api/v1',
  accessToken: 'your-jwt-token'
});

// Create intent
const intent = await client.intents.create({
  name: 'user-onboarding',
  definition: {
    type: 'workflow',
    steps: [...]
  }
});

// Execute workflow
const workflow = await client.workflows.execute({
  intentId: intent.id,
  parameters: { user: { email: 'john@example.com' } }
});
```

## Webhooks

The API supports webhooks for real-time notifications of events.

### Webhook Events

- `intent.created`: Intent created
- `intent.updated`: Intent updated
- `intent.deleted`: Intent deleted
- `workflow.started`: Workflow execution started
- `workflow.completed`: Workflow execution completed
- `workflow.failed`: Workflow execution failed

### Webhook Payload

```json
{
  "event": "workflow.completed",
  "data": {
    "id": "87654321-fedc-ba09-8765-4321fedcba09",
    "intent_id": "12345678-90ab-cdef-1234-567890abcdef",
    "status": "completed",
    "completed_at": "2024-01-04T12:05:00Z"
  },
  "timestamp": "2024-01-04T12:05:00Z"
}
```

## OpenAPI Specification

The complete API specification is available in OpenAPI 3.0 format:

- **OpenAPI JSON**: `/api/v1/openapi.json`
- **Interactive Docs**: `/api/v1/docs`
- **ReDoc**: `/api/v1/redoc`

## Support

For API support and questions:

- **Documentation**: [docs.quantum.centrex.ai](https://docs.quantum.centrex.ai)
- **GitHub Issues**: [github.com/Dylan-Natter/quantum-platform/issues](https://github.com/Dylan-Natter/quantum-platform/issues)
- **Email**: api-support@centrex.ai

---

*This API reference is automatically generated from the OpenAPI specification and is always up-to-date with the latest version.*
