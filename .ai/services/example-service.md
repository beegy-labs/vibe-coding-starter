# Example Service Context

> Tier 1 - Service Context

## Overview

Python backend service with FastAPI + SQLModel

## Tech Stack

| Tech | Purpose |
|------|---------|
| Python 3.11+ | Runtime |
| FastAPI | Framework |
| SQLModel | ORM |
| SQLite | Database (dev) |

## Structure

```
services/example-service/src/
+-- main.py        # FastAPI app entry
+-- models/        # SQLModel models
+-- db/            # Database setup
+-- api/routes/    # API endpoints
```

## Commands

```bash
pnpm --filter example-service dev    # localhost:8000
pnpm --filter example-service test
```

## Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | /health | Health check |
| GET | /todos | List todos |
| POST | /todos | Create todo |
| PATCH | /todos/:id | Update todo |
| DELETE | /todos/:id | Delete todo |

## Current Work

See `.specs/example-todo/tasks/2026-S1/` (Task 01)
