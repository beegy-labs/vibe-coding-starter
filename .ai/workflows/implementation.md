# Implementation Workflow

> Tier 1 pointer | Full: `docs/llm/guides/implementation.md`

## Quick Flow

```
1. Read .specs/{app-name}/roadmap.md
2. Check scopes/ for current scope
3. Read tasks/{scope}/ for plan
4. No tasks? -> Ask: "Create task plan?"
```

## Spec Not Found

```
[!] No spec for '{keyword}'.
1. Create spec first? (Recommended)
2. Implement directly?
```

## SDD 3-Layer

| Layer | Path | Action |
|-------|------|--------|
| L1 | roadmap.md | Check big picture |
| L2 | scopes/*.md | Check scope |
| L3 | tasks/{scope}/ | Execute plan |

## Full Guide

See `docs/llm/guides/implementation.md`
