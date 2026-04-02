---
agent: 'agent'
description: 'Analyze and fix a bug with explanation'
model: 'Claude Opus 4.6'
---

Analyze the selected code and fix the bug described below:

**Bug Description:** ${input:bugDescription}
**Expected Behavior:** ${input:expectedBehavior}
**Current Behavior:** ${input:actualBehavior}

## Your Response Should Include:
1. Root cause analysis
2. The fix with explanation
3. Any related issues this might cause
4. Suggested test to prevent regression
