---
agent: 'agent'
description: 'Create a new API endpoint with validation and error handling'
model: 'Claude Opus 4.6'
---

Create a new API route at `src/app/api/${input:resourceName}/route.ts`:

## Requirements
- Implement ${input:httpMethods} methods
- Use Zod schema for request validation
- Include proper error handling with our ApiResponse type
- Add rate limiting check
- Log all requests to monitoring

## Include
- Request/response type definitions
- Validation schemas
- Integration tests in `__tests__/api/${input:resourceName}.test.ts`
