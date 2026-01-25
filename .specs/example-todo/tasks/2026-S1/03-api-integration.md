# Task 03: API Integration

> Target: apps/example-app/ | Depends on: 01, 02

## Steps

### Phase 1 (API Client)

- [ ] Create services/api.ts with fetch wrapper
- [ ] Configure API base URL (VITE_API_URL env)
- [ ] Add error handling

### Phase 2 (Connect Components)

- [ ] Create hooks/useTodos.ts with API calls
- [ ] Connect TodoList to GET /todos
- [ ] Connect AddTodo to POST /todos
- [ ] Connect TodoItem toggle to PATCH /todos/:id
- [ ] Connect TodoItem delete to DELETE /todos/:id

## Files

```
apps/example-app/src/
+-- services/
|   +-- api.ts            # Fetch wrapper
+-- hooks/
|   +-- useTodos.ts       # CRUD operations
+-- types/
    +-- todo.ts           # Todo interface
```

## API Endpoints

| Method | Path | Body | Response |
|--------|------|------|----------|
| GET | /todos | - | Todo[] |
| POST | /todos | { title } | Todo |
| PATCH | /todos/:id | { completed } | Todo |
| DELETE | /todos/:id | - | { ok } |

## Verify

```bash
# Terminal 1: Backend
pnpm --filter example-service dev

# Terminal 2: Frontend
pnpm --filter example-app dev

# Test in browser: localhost:5173
```

## Done

- [ ] Steps complete
- [ ] All CRUD operations work
