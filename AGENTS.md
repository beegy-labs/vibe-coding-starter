# AGENTS.md

> Minimal router for LLM agents | [ADD Policy](docs/llm/policies/add.md)

## Entry Point

1. Read `.ai/README.md` first (project overview)
2. Check `.specs/{service}/index.md` for current work

## Quick Rules

| Rule | Description |
|------|-------------|
| No direct commit | Always create branch, never push to main directly |
| No secrets | Never modify `.env`, credentials, API keys |
| Spec first | Check spec exists before implementation |

## Workflows

| Action | Guide |
|--------|-------|
| Implementation request | `.ai/workflows/implementation.md` |
| Code review | `.ai/workflows/review.md` |
| Problem/Incident | `.ai/workflows/incident.md` |

## Code Style (Quick Reference)

| Type | Pattern | Example |
|------|---------|---------|
| Component | PascalCase | `UserProfile.tsx` |
| Utility | camelCase | `formatDate.ts` |
| Constants | SCREAMING_SNAKE | `API_ENDPOINTS.ts` |

## Commit Format

```
<type>(<scope>): <subject>
types: feat, fix, docs, style, refactor, test, chore
```
