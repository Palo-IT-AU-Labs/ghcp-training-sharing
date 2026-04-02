# Copilot Instructions for [Your Project Name]

## Tech Stack
- TypeScript (strict mode, always)
- React 18 with functional components only
- TanStack Query for data fetching
- Zod for validation
- Tailwind CSS for styling

## Code Style
- Use named exports, not default exports
- Prefer `const` over `let`; never use `var`
- All functions should have explicit return types
- Use early returns to reduce nesting
- Maximum function length: 50 lines

## File Organization
- Co-locate tests with source files (`Component.tsx` + `Component.test.tsx`)
- Use barrel exports (`index.ts`) for public APIs only
- Keep components under 200 lines; extract hooks if larger

## Security
- Never commit secrets or API keys
- Always sanitize user input
- Use parameterized queries for any database operations
- Validate all external data with Zod schemas

## What NOT to Do
- Don't use `any` type (use `unknown` and narrow)
- Don't use class components
- Don't use moment.js (use date-fns instead)
- Don't write inline CSS
