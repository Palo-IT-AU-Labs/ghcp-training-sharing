---
name: github-issues
description: Create well-structured GitHub issues using team templates. Use when the user wants to file a bug, request a feature, or create any GitHub issue. Ensures consistent formatting and required fields.
metadata:
  author: your-org
  version: "1.0"
---

# GitHub Issue Creation

## When to Use This Skill

Use this skill when:
- User wants to create a GitHub issue
- User found a bug and wants to report it
- User wants to request a new feature
- User mentions "file an issue" or "create a ticket"

## Required Tools

This skill works with the GitHub MCP server. Ensure it's configured in `.vscode/mcp.json`.

## Instructions

### For Bug Reports

1. Gather information about the bug:
   - Steps to reproduce
   - Expected vs actual behavior
   - Environment details

2. Use the bug report template at `templates/bug-report.md`

3. Create the issue using the GitHub MCP `create_issue` tool

### For Feature Requests

1. Clarify the feature requirements
2. Use the feature template at `templates/feature-request.md`
3. Create the issue with appropriate labels

## Templates

### Bug Report Template

`templates/bug-report.md`:

```markdown
## Bug Description
{Brief description}

## Steps to Reproduce
1. 
2. 
3. 

## Expected Behavior
{What should happen}

## Actual Behavior
{What actually happens}

## Environment
- OS: 
- Version: 
- Browser (if applicable): 

## Screenshots
{If applicable}
```

### Feature Request Template

`templates/feature-request.md`:

```markdown
## Feature Description
{What feature is being requested}

## Use Case
{Why this feature is needed}

## Proposed Solution
{How it might work}

## Alternatives Considered
{Other approaches}
```
