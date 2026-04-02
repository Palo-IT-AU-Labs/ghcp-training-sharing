 ---
name: jira-workflow
description: Create and manage Jira issues following team conventions. Use when the user wants to file a bug, create a story, plan an epic, or manage sprint work. Ensures consistent formatting and required fields.
---

# Jira Workflow

## When to use this skill

Use this skill when:
- User wants to create a Jira ticket
- User found a bug and wants to report it
- User wants to create a user story or epic
- User mentions "file a ticket", "create a Jira", or "plan a sprint"

## Required tools

This skill requires the Jira MCP server for API access. The skill provides conventions; the MCP server provides the connection.

## Issue type mapping

Read the appropriate template based on issue type:

| Issue Type | Template | Jira Type | Default Priority |
|------------|----------|-----------|------------------|
| Bug | templates/bug.md | Bug | High |
| Story | templates/story.md | Story | Medium |
| Epic | templates/epic.md | Epic | Medium |
| Task | templates/task.md | Task | Medium |

## Team conventions

- All stories must have acceptance criteria
- Epics must link to their child stories
- Bugs must include reproduction steps
- Use story points: 1, 2, 3, 5, 8, 13
- Sprint prefix: `SPRINT-XX:`

## Instructions

1. Determine issue type from user's description
2. Read the matching template from templates/
3. Fill in the template with user-provided details
4. Set appropriate fields (priority, story points, sprint)
5. Use the Jira MCP server to create the issue
6. Return the issue key and URL to the user
