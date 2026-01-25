# SDD (Spec-Driven Development)

> Human-commanded task planning | Last Updated: 2026-01-25

## Core

```
Human = Direction (WHAT/WHY)
LLM   = Documentation + Planning (HOW)
```

**Principle**: Human explains, LLM writes everything.

## 3-Layer Structure

```
roadmap.md      Human explains -> LLM documents (big picture)
scopes/{id}.md  Human explains -> LLM documents (scope)
tasks/{scope}/  Human requests -> LLM generates (plan)
```

| Layer | File | Human | LLM |
|-------|------|-------|-----|
| L1 Roadmap | roadmap.md | Explains | Documents |
| L2 Scope | scopes/*.md | Explains | Documents |
| L3 Tasks | tasks/{scope}/ | Requests + Approves | Generates |

## Directory

```
.specs/{target}/
+-- roadmap.md
+-- scopes/
|   +-- 2026-scope1.md
+-- tasks/
|   +-- 2026-scope1/
|       +-- index.md
|       +-- 01-task-a.md
|       +-- 02-task-b.md
+-- history/
```

## Workflow

```
L1: [Human] "Building mail service with login, signup, send, receive"
    [LLM] -> roadmap.md

L2: [Human] "Signup first. Google + native login"
    [LLM] -> scopes/2026-scope1.md

L3: [Human] "Use Google Auth, get name/email. Plan with parallel/sequential"
    [LLM] -> tasks/2026-scope1/
            - index.md (status, deps)
            - 01-google-auth.md (parallel)
            - 02-native-auth.md (parallel)
            - 03-integration.md (sequential)

[Human] "Approved" -> Execute
        "Revise X" -> LLM revises

Execute -> Success -> Archive + CDD update
        -> Failure -> Feedback -> Human decides
```

## Templates

### roadmap.md

```markdown
# Roadmap: {Service}

| Feature | Priority | Status |
|---------|----------|--------|
| Login | P0 | Planned |
| Signup | P0 | Planned |

| Scope | Features | Target |
|-------|----------|--------|
| 2026-S1 | Signup | Q1 |
```

### scopes/{id}.md

```markdown
# Scope: 2026-Scope1

## Direction
{Human's explanation verbatim}

## Target
- Google OAuth
- Native login

## Priority
1. Google Auth
2. Native Auth
```

### tasks/{scope}/index.md

```markdown
# Tasks: 2026-Scope1

## Status
| Total | Done | Progress | Pending |
|-------|------|----------|---------|
| 4 | 0 | 0 | 4 |

## Dependencies
[01] --+
       +--> [03] --> [04]
[02] --+

## Parallel Groups
| Group | Tasks | Start |
|-------|-------|-------|
| A | 01,02 | Now |
| B | 03 | After A |
| C | 04 | After B |

## Summary
| # | Task | Depends | Status |
|---|------|---------|--------|
| 01 | Google Auth | - | Pending |
| 02 | Native Auth | - | Pending |
| 03 | Integration | 01,02 | Blocked |
```

### tasks/{scope}/{nn}-{name}.md

```markdown
# Task 01: Google Auth

## Steps
### Phase 1 (Parallel)
- [ ] Create OAuth credentials
- [ ] Add dependencies

### Phase 2 (Sequential)
- [ ] Implement callback
- [ ] Store user info

## Verify
pnpm test src/auth/

## Done
- [ ] Steps complete
- [ ] Tests pass
```

## Feedback Loop

```
Failure -> Feedback Report -> Human Review
                                |
                                +-> "Revise scope" -> Re-plan
                                +-> "Proceed" -> Retry
                                +-> "Cancel" -> Archive
```

### Feedback Template

```markdown
# Feedback: {Task}

## Failure
- Task: 01-google-auth.md
- Error: API rate limit

## Options
1. Retry with backoff
2. Use mock for dev
3. Different provider

## Decision Required
```

## Retention

| Status | Location | Keep | Access |
|--------|----------|------|--------|
| Active | scopes/, tasks/ | Until done | Direct |
| Done | history/ | 90 days | Direct |
| Archive | DB/S3 | Forever | Query |

## Success Metrics

| Metric | Target |
|--------|--------|
| Coverage | >=80% |
| Tasks | 100% done |
| CDD | Updated |

## Best Practices

| Practice | Rule |
|----------|------|
| Human explains | Don't write, explain |
| LLM documents | All writing by LLM |
| Approve/Reject | Human judges only |
| Parallel first | Identify parallel tasks |
| Feedback loop | Failures trigger review |

## References

- CDD: docs/llm/policies/cdd.md
- ADD: docs/llm/policies/add.md
