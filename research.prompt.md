---
agent: 'agent'
description: 'Research a topic and summarize findings'
model: 'Claude Opus 4.6'
tools: ['fetch']
---

Research the following topic and provide a summary:

**Topic:** ${input:researchTopic}
**Focus Areas:** ${input:focusAreas}
**Depth:** ${input:depth}  <!-- quick overview, detailed analysis, comprehensive report -->

## Instructions

1. Identify 3-5 authoritative sources for this topic:
   - Official documentation sites
   - Reputable tech blogs and publications
   - GitHub repositories or discussions

2. Use the fetch tool to retrieve content from these sources

3. Synthesize the information into a structured summary:
   - **Overview:** 2-3 sentence summary
   - **Key Points:** Bullet list of important findings
   - **Code Examples:** If applicable, include relevant snippets
   - **Best Practices:** Recommendations based on research
   - **Sources:** List URLs consulted

4. Highlight any conflicting information or areas of uncertainty

5. Provide actionable next steps based on the research
