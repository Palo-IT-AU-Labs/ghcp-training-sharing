---
agent: 'agent'
description: 'Create a GitHub issue from a bug report or feature request'
model: 'Claude Opus 4.6'
tools: ['githubRepo']
---

Create a GitHub issue based on the following:

**Type:** ${input:issueType}  <!-- bug, feature, enhancement, documentation -->
**Title:** ${input:issueTitle}
**Description:** ${input:issueDescription}

## Instructions

1. Format the issue body with proper markdown:
   - For bugs: Include "Steps to Reproduce", "Expected Behavior", "Actual Behavior", and "Environment"
   - For features: Include "Problem Statement", "Proposed Solution", and "Alternatives Considered"

2. Apply appropriate labels based on issue type:
   - bug → `bug`, `needs-triage`
   - feature → `enhancement`, `needs-discussion`
   - documentation → `documentation`

3. Use the GitHub MCP server to create the issue in this repository

4. Return the issue URL when complete
