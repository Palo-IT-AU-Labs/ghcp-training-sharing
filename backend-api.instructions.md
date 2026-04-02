---
name: 'Backend API Conventions'
description: 'REST API patterns, validation, and error handling'
applyTo: 'src/api/**/*,src/server/**/*'
---

# Backend API Guidelines

## Response Envelope
All responses use `ApiResponse<T>`:
```typescript
interface ApiResponse<T> {
  success: boolean;
  data?: T;
  error?: { code: string; message: string };
}
```

## Validation
- Validate every request body with a Zod schema
- Schemas live alongside the route file: `route.ts` + `route.schema.ts`

## Authentication
- All routes under `/api/protected/` require a valid session
- Use the `requireAuth()` middleware — never check `session` manually

## Error Handling
Throw typed errors from our error hierarchy (`ValidationError`, `NotFoundError`, etc.). The global error handler converts them to `ApiResponse` format.
