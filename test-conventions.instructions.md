---
name: 'Testing Conventions'
description: 'Test structure, naming, and patterns'
applyTo: '**/*.test.{ts,tsx},**/*.spec.{ts,tsx}'
---

# Testing Standards

## Structure
- Use `describe()` for grouping, `it()` for individual cases (not `test()`)
- Follow Arrange-Act-Assert pattern
- One assertion per test when practical

## Naming
- Describe blocks: noun (the thing under test)
- It blocks: `should [behavior] when [condition]`

## Mocking
- Mock external services only — never mock the module under test
- Use `vi.mock()` for module mocks, `vi.fn()` for function stubs
- Reset mocks in `beforeEach`

## Coverage
- All public functions must have at least one happy-path and one error-path test
