# Implementation Workflow

> Spec-first validation and execution

## Before Implementation

```
User: "Implement X"
    |
    v
Read .specs/{app-name}/roadmap.md
    |
    v
Check scopes/ for scope
    |
    v
Read tasks/{scope}/
    |
    +-> Found -> Execute tasks
    +-> Not found -> "[!] Create task plan?"
```

## Spec Not Found Response

```
[!] No spec for '{keyword}'.

Choose:
1. Create spec first? (Recommended)
2. Implement directly?
```

## SDD 3-Layer Creation

```
L1: roadmap.md
    Human explains big picture -> LLM documents

L2: scopes/{id}.md
    Human explains scope -> LLM documents

L3: tasks/{scope}/
    Human requests -> LLM generates plan
    - index.md (status, deps)
    - 01-task.md
    - 02-task.md
```

## Task Execution

```
1. Read tasks/{scope}/index.md
2. Check dependencies
3. Execute in order:
   - Parallel tasks: simultaneous
   - Sequential tasks: wait for deps
4. Update checkbox on completion
5. On all done:
   - Move to history/
   - Update CDD if new patterns
```

## Task File Template

```markdown
# Task 01: {Name}

## Steps
### Phase 1 (Parallel)
- [ ] Step 1
- [ ] Step 2

### Phase 2 (Sequential)
- [ ] Step 3 (after Phase 1)

## Verify
pnpm test

## Done
- [ ] Steps complete
- [ ] Tests pass
```

## Post-Implementation

| Action | When |
|--------|------|
| Archive | Move to history/ |
| Update CDD | New patterns found |
| Update index | Remove from active |
