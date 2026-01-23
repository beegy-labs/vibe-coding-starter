# SDD (Spec-Driven Development)

> Human-Commanded Staged Auto-Design | **Policy**: `docs/llm/policies/sdd.md`

## 3-Layer Structure

```
roadmap.md  (WHAT)  →  scopes/*.md  (WHEN)  →  tasks/*.md  (HOW)
   Human designs         Human defines           LLM generates
```

| Layer       | File                | Role                    | Human          | LLM      |
| ----------- | ------------------- | ----------------------- | -------------- | -------- |
| **Roadmap** | `roadmap.md`        | Define overall direction | Design & Plan  | Document |
| **Scope**   | `scopes/{scope}.md` | Extract work scope      | Define & Approve | Document |
| **Tasks**   | `tasks/{scope}.md`  | Detailed implementation | Review & Approve | Generate |

## Directory Structure

```
.specs/apps/{app}/
├── roadmap.md                # WHAT: Overall direction
├── scopes/                   # WHEN: Work scope
│   └── 2026-Q1.md
├── tasks/                    # HOW: Implementation plan
│   └── 2026-Q1.md
└── history/                  # Completed archives
    ├── scopes/
    └── decisions/
```

## Token Load Strategy

| Situation        | Load                                     | Skip                     |
| ---------------- | ---------------------------------------- | ------------------------ |
| Planning         | `roadmap.md`                             | scopes, tasks, history   |
| Starting work    | `scopes/{scope}.md`, `tasks/{scope}.md`  | roadmap, other scopes    |
| Continuing work  | `tasks/{scope}.md`                       | Everything else          |
