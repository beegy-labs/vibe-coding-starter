# Task 02: Frontend Setup

> Target: apps/example-app/ | Parallel Group A

## Steps

### Phase 1 (Setup)

- [ ] Initialize Vite + React + TypeScript
- [ ] Add TailwindCSS
- [ ] Configure path aliases (@/)
- [ ] Create directory structure (2026 best practices)

### Phase 2 (Components)

- [ ] Create components/TodoList.tsx
- [ ] Create components/TodoItem.tsx
- [ ] Create components/AddTodo.tsx
- [ ] Create types/todo.ts
- [ ] Add local state (before API integration)

## Files

```
apps/example-app/
+-- package.json
+-- vite.config.ts        # path aliases
+-- tailwind.config.js
+-- tsconfig.json
+-- index.html
+-- src/
    +-- main.tsx          # Entry point
    +-- App.tsx
    +-- components/       # UI components
    |   +-- TodoList.tsx
    |   +-- TodoItem.tsx
    |   +-- AddTodo.tsx
    +-- hooks/            # Custom hooks
    |   +-- useTodos.ts
    +-- services/         # API client
    |   +-- api.ts
    +-- types/            # TypeScript types
    |   +-- todo.ts
    +-- styles/           # Global styles
        +-- index.css
```

## Verify

```bash
pnpm --filter example-app dev
# Check localhost:5173
```

## Done

- [ ] Steps complete
- [ ] UI renders with local state
