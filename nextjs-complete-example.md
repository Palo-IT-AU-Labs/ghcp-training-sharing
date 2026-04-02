# Project Guidelines for Copilot

## Project Overview
This is a B2B SaaS platform for inventory management. 
We prioritize reliability over cutting-edge features.

## Architecture
- Next.js 14 App Router
- PostgreSQL with Prisma ORM
- NextAuth.js for authentication
- Stripe for payments
- Deployed on Vercel

### Directory Structure
```
src/
+-- app/                    # Next.js App Router pages
—   +-- (auth)/            # Auth-required routes (grouped)
—   +-- (public)/          # Public routes
—   +-- api/               # API routes (webhooks only)
+-- components/
—   +-- ui/                # Shared UI primitives
—   +-- features/          # Feature-specific components
+-- lib/                   # Shared utilities
+-- server/
—   +-- actions/           # Server Actions
—   +-- db/                # Database queries (Prisma)
—   +-- services/          # Business logic
+-- types/                 # Shared TypeScript types
```

### Data Flow
1. Client components call Server Actions for mutations
2. Server Components fetch data directly via Prisma
3. TanStack Query for client-side cache invalidation
4. Never use Route Handlers except for webhooks

## Coding Standards

### TypeScript
- Enable all strict checks
- No `any` types except in test mocks
- Prefer interfaces over types for object shapes
- Use discriminated unions for complex state
- Export types from `types/` directory, not inline

### React Patterns
```typescript
// ✅ Good: Custom hook for data fetching
function useInventoryItems(warehouseId: string) {
  return useQuery({
    queryKey: ['inventory', warehouseId],
    queryFn: () => fetchInventory(warehouseId),
  });
}

// ❌ Bad: Fetching in useEffect
useEffect(() => {
  fetch('/api/inventory').then(/* ... */);
}, []);
```

### Server Actions
```typescript
// ✅ Good: Validated, authorized, audited
export async function updateInventory(input: UpdateInventoryInput) {
  const validated = updateInventorySchema.parse(input);
  const session = await auth();
  if (!session) throw new UnauthorizedError();
  
  await auditLog('inventory.update', { userId: session.user.id, ...validated });
  return db.inventory.update({ where: { id: validated.id }, data: validated });
}

// ❌ Bad: No validation, no auth check
export async function updateInventory(data: any) {
  return db.inventory.update({ data });
}
```

## Testing Requirements

### Test Structure
- Co-locate unit tests with source: `Component.tsx` → `Component.test.tsx`
- Integration tests in `__tests__/integration/`
- E2E tests in `e2e/` using Playwright

### Coverage Requirements
- Minimum 80% line coverage for `server/` directory
- All Server Actions must have integration tests
- All user-facing flows must have E2E tests

### Testing Patterns
```typescript
// ✅ Good: Descriptive test with clear arrange/act/assert
describe('updateInventory', () => {
  it('should update quantity and log audit event', async () => {
    // Arrange
    const item = await createTestInventoryItem({ quantity: 10 });
    
    // Act
    await updateInventory({ id: item.id, quantity: 15 });
    
    // Assert
    const updated = await db.inventory.findUnique({ where: { id: item.id } });
    expect(updated?.quantity).toBe(15);
    expect(await getAuditLogs('inventory.update')).toHaveLength(1);
  });
});

// ❌ Bad: Vague test name, no clear structure
test('inventory works', async () => {
  const result = await updateInventory({ id: '1', quantity: 5 });
  expect(result).toBeTruthy();
});
```

### Mocking Guidelines
- Use `vi.mock()` for external services only
- Never mock Prisma in integration tests (use test database)
- Reset mocks in `beforeEach`, not `afterEach`

## Error Handling

### Error Types
Use our custom error hierarchy:
- `AppError` - Base class for all application errors
- `ValidationError` - Invalid input (400)
- `UnauthorizedError` - Not authenticated (401)
- `ForbiddenError` - Not authorized (403)  
- `NotFoundError` - Resource doesn't exist (404)

### Error Pattern
```typescript
// ✅ Good: Specific error with context
if (!warehouse) {
  throw new NotFoundError('Warehouse', warehouseId);
}

// ❌ Bad: Generic error
if (!warehouse) {
  throw new Error('Not found');
}
```

## Security Guidelines

### Authentication
- All `/app/(auth)/` routes require session
- Use `auth()` from NextAuth, never roll your own
- Session checks happen in Server Components, not middleware

### Authorization
- All queries must include `organizationId` filter
- Use `assertCanAccess(resource, session)` helper
- Never trust client-provided organization IDs

### Data Validation
- Validate ALL external input with Zod schemas
- Schemas live in `lib/schemas/` 
- Reuse schemas between client and server

## Performance Guidelines

### Database
- Always use `select` to limit returned fields
- Use `include` sparingly (prefer separate queries)
- Add indexes for any field used in WHERE clauses

### React
- Use `React.memo()` only when profiler shows need
- Prefer Server Components for static content
- Use `loading.tsx` for Suspense boundaries

## Dependencies

### Approved Libraries
- Date handling: `date-fns` (NOT moment.js)
- Forms: `react-hook-form` + `zod`
- Styling: Tailwind CSS only
- Icons: `lucide-react`

### Deprecated (Do Not Use)
- `moment.js` - Use `date-fns` instead
- `axios` - Use native `fetch`
- `lodash` - Use native methods or `es-toolkit`
- Class components - Use functional components

## Git Conventions

### Branch Naming
- `feature/INV-123-add-bulk-import`
- `fix/INV-456-quantity-calculation`
- `chore/update-dependencies`

### Commit Messages
Follow Conventional Commits:
- `feat(inventory): add bulk import endpoint`
- `fix(auth): handle expired session redirect`
- `test(warehouse): add integration tests for transfer`
