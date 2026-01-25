# Code Review Workflow

> Tier 1 pointer | Full guide: `docs/llm/guides/review.md`

## Pre-Review Checklist

```
- [ ] pnpm lint passes
- [ ] pnpm test passes
- [ ] pnpm build succeeds
- [ ] Docs updated (.ai/, .specs/)
```

## Review Types

| Type | Trigger |
|------|---------|
| Auto | PR creation (CI/CD) |
| Manual | User request |
| Peer | Complex changes |

## Severity Levels

| Level | Action |
|-------|--------|
| High | Must fix before merge |
| Medium | Should fix |
| Low | Optional |

## Full Guide

See `docs/llm/guides/review.md` for:
- Review report format
- Manual review flow
- Detailed checklist
