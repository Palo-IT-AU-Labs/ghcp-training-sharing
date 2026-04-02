---
name: git-workflow
description: Execute Git operations including commits, branching, rebasing, and history analysis. Use when the user wants to commit changes, create branches, view git history, resolve merge conflicts, or perform interactive rebases.
---

# Git Workflow

## When to use this skill

Use this skill when:
- User wants to commit, stage, or unstage changes
- User needs to create, switch, or delete branches
- User asks about git history or blame
- User wants to rebase, cherry-pick, or resolve conflicts

## How to commit changes

**Always run tests before committing.** This ensures broken code doesn't enter the repository.

1. Run tests first: `npm test` (or `yarn test`, `pnpm test`, `pytest`, `go test ./...`)
2. If tests pass, stage changes: `git add -A` (all) or `git add -p` (interactive)
3. Commit with conventional format: `git commit -m "feat(scope): description"`
4. For fixups: `git commit --amend`

If tests fail, fix the issues before committing. Never skip tests.

## How to run tests

Detect and run the project's test command:

- Node.js: `npm test` or check `package.json` scripts
- Python: `pytest` or `python -m pytest`
- Go: `go test ./...`
- Rust: `cargo test`
- Java/Kotlin: `./gradlew test` or `mvn test`

For quick validation: `npm run lint && npm test`

## How to manage branches

Create and switch: `git checkout -b feature/branch-name`
Delete merged: `git branch -d branch-name`
List all: `git branch -a`

## How to view history

Recent commits: `git log --oneline -20`
File history: `git log --follow -p filename`
Who changed a line: `git blame filename`

## How to rebase

Interactive rebase: `git rebase -i HEAD~n`
Resolve conflicts: Edit files, then `git add` and `git rebase --continue`
