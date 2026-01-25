# Task 01: Backend Setup

> Target: services/example-service/ | Parallel Group A

## Steps

### Phase 1 (Setup)

- [ ] Create pyproject.toml with FastAPI, SQLModel, uvicorn
- [ ] Create package.json with dev scripts (uv run)
- [ ] Create directory structure

### Phase 2 (Implementation)

- [ ] Create src/main.py with FastAPI app + CORS
- [ ] Create src/models/todo.py with Todo model
- [ ] Create src/db/database.py with SQLite setup
- [ ] Create src/api/routes/todos.py with CRUD endpoints
- [ ] Add health check endpoint

## Files

```
services/example-service/
+-- pyproject.toml
+-- package.json
+-- src/
    +-- main.py           # FastAPI app entry
    +-- models/
    |   +-- __init__.py
    |   +-- todo.py       # Todo SQLModel
    +-- db/
    |   +-- __init__.py
    |   +-- database.py   # SQLite engine
    +-- api/
        +-- __init__.py
        +-- routes/
            +-- __init__.py
            +-- todos.py  # CRUD endpoints
```

## Verify

```bash
pnpm --filter example-service dev
curl localhost:8000/health
curl localhost:8000/todos
```

## Done

- [ ] Steps complete
- [ ] All endpoints respond
