# Incident Workflow

> Problem resolution and escalation

## Resolution Flow

```
Problem
    |
    v
Step 1: Self-Resolution
    - Re-read CDD
    - Search codebase
    - Run tests
    |
    v
Step 2: Peer Consensus (if multi-agent)
    - Describe problem
    - Propose solutions
    - Vote
    |
    v
Step 3: Human Intervention
    - Generate report
```

## Self-Resolution

```yaml
attempt_1: Check CDD
  files: docs/llm/guides/, docs/llm/tech/

attempt_2: Search codebase
  method: grep similar implementations

attempt_3: Run tests
  method: related test suites
```

## Incident Report

```markdown
# Incident Report

## Problem
- Description: What went wrong
- Location: file:line
- Error: Message

## Attempts
### Attempt 1: {approach}
- Result: Failed
- Reason: Why

## Consensus (if multi-agent)
| Agent | Solution | Vote |
|-------|----------|------|
| 1 | A | Y |
| 2 | B | N |

## Action Required
- [ ] CDD: Add pattern to docs/llm/
- [ ] SDD: Clarify in .specs/{target}/scopes/

## After Update
Restart from Step X
```

## Human Intervention

**Human does NOT write code.**

1. Review report
2. Identify cause:
   - Missing pattern -> Update CDD
   - Unclear requirement -> Update SDD scope
3. Restart agents

## Post-Incident

1. Extract learnings
2. Update CDD with pattern
3. Archive if applicable
