# Code Review Workflow

> Automated and manual code review process

## Pre-Review Checklist

Before requesting review:

```
- [ ] pnpm lint passes
- [ ] pnpm test passes
- [ ] pnpm build succeeds
- [ ] Related docs updated (.ai/, .specs/)
```

## Review Types

| Type | Trigger | Agent |
|------|---------|-------|
| Auto | On PR creation | CI/CD |
| Manual | User request | LLM Agent |
| Peer | Complex changes | Multi-agent consensus |

## Manual Review Flow

```
User: "Review this code"
         |
         v
Step 1: Identify changed files
         |
         v
Step 2: Check against:
         - Code style (AGENTS.md)
         - Patterns (CDD docs)
         - Spec compliance (SDD tasks)
         |
         v
Step 3: Report findings
```

## Review Report Format

```markdown
## Code Review Report

### Summary
- Files reviewed: {count}
- Issues found: {count}
- Severity: {low/medium/high}

### Issues

#### 1. {Issue Title}
- **File**: `path/to/file.ts:line`
- **Severity**: {low/medium/high}
- **Description**: What's wrong
- **Suggestion**: How to fix

### Approved Items
- [x] Code style compliance
- [x] Test coverage adequate
- [x] Documentation updated

### Recommendation
{APPROVE / REQUEST_CHANGES / COMMENT}
```

## Severity Levels

| Level | Description | Action |
|-------|-------------|--------|
| High | Security, data loss risk | Must fix before merge |
| Medium | Performance, maintainability | Should fix |
| Low | Style, minor improvements | Optional |
