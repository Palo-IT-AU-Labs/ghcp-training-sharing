---
agent: 'agent'
description: 'Scaffold a new React component with all the trimmings'
model: 'Claude Opus 4.6'
---

Create a new component called `${input:componentName}` in `src/components/${input:componentName}/`:

## Required Files
1. `${input:componentName}.tsx` - The component
2. `${input:componentName}.test.tsx` - Unit tests  
3. `${input:componentName}.stories.tsx` - Storybook stories
4. `index.ts` - Barrel export

## Component Requirements
- TypeScript with explicit prop types
- Proper accessibility attributes
- Loading and error states
- Mobile-responsive design

## Reference
Look at existing components for patterns. Follow the style guide in copilot-instructions.md.
