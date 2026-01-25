# Incident Workflow

> Tier 1 pointer | Full guide: `docs/llm/guides/incident.md`

## Quick Flow

```
Problem -> Self-Resolution -> Peer Consensus -> Human Intervention
```

## Self-Resolution Steps

1. Re-read CDD for patterns
2. Search codebase for similar solutions
3. Run tests to validate

## When to Escalate

- Self-resolution fails after 3 attempts
- Peer consensus not reached
- Requires CDD/SDD update

## Human Intervention

Human does NOT write code. Instead:
1. Review incident report
2. Update CDD (pattern) or SDD (requirement)
3. Restart agent

## Full Guide

See `docs/llm/guides/incident.md` for:
- Incident report format
- Peer consensus process
- Post-incident updates
