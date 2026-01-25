# SDD (Spec-Driven Development)

> Human-Commanded Staged Auto-Design | **Policy**: `docs/llm/policies/sdd.md`

## Scope

SDD specs are organized by **app/software unit**, not by monorepo structure.
One spec = one complete application (may span multiple packages).

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

## Directory Structure

```
.specs/{app-name}/
+-- roadmap.md
+-- scopes/
|   +-- 2026-S1.md
+-- tasks/
|   +-- 2026-S1/
|       +-- index.md
|       +-- 01-task.md
|       +-- 02-task.md
+-- history/
```

## Example

```
.specs/example-todo/          # App unit (includes frontend + backend)
+-- roadmap.md                # Big picture for entire app
+-- scopes/2026-S1.md         # Scope covering both layers
+-- tasks/2026-S1/            # Tasks may target different packages
    +-- 01-backend-setup.md   # -> services/example-service/
    +-- 02-frontend-setup.md  # -> apps/example-app/
```

## Token Load Strategy

| Situation | Load | Skip |
|-----------|------|------|
| Planning | roadmap.md | scopes, tasks, history |
| Starting work | scopes/{scope}.md, tasks/{scope}/ | roadmap, other scopes |
| Continuing work | tasks/{scope}/ | Everything else |
