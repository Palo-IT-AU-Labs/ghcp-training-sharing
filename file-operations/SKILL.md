---
name: file-operations
description: Advanced file system operations including log analysis, directory searching, and batch file processing. Use when the user needs to search files, analyze logs, find patterns across directories, or run local scripts.
---

# File System Operations

## When to use this skill

Use this skill when:
- User wants to search for files by name or content
- User needs to analyze log files for errors or patterns
- User wants to batch rename or process files

## How to analyze logs

Find errors: `grep -r "ERROR\|FATAL" logs/ --include="*.log" | tail -50`
Errors with context: `grep -B 2 -A 5 "ERROR" app.log`

## How to search directories

Find by name: `find . -name "*.ts" -type f`
Find by content: `grep -rl "searchTerm" src/`
Find large files: `find . -size +10M -type f`
Recent files: `find . -mtime -1 -type f`

## How to batch process files

Rename extension: `for f in *.jpeg; do mv "$f" "${f%.jpeg}.jpg"; done`
Delete node_modules: `find . -name "node_modules" -type d -prune -exec rm -rf {} +`
Count lines: `wc -l filename`
Disk usage: `du -sh directory`
