---
name: 'Infrastructure Config'
description: 'Rules for CI/CD, Docker, and config files'
applyTo: '**/Dockerfile,**/.github/workflows/**,**/docker-compose*.yml'
---

# Infrastructure Conventions

## Docker
- Use multi-stage builds to minimize image size
- Pin base image versions (e.g., `node:20.11-alpine`, not `node:latest`)
- Run as non-root user in production images

## GitHub Actions
- Pin action versions to full SHA, not tags
- Cache dependencies (`actions/cache`) in every build workflow
- Use environment secrets — never hardcode credentials
