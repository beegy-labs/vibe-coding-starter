# Example Project

> CDD Tier 1 - Indicator (≤50 lines) | Multi-LLM Compatible

## Project Overview

Full-stack monorepo project template

## Tech Stack

| Layer    | Technology          |
| -------- | ------------------- |
| Frontend | React, TypeScript   |
| Backend  | Node.js, TypeScript |
| Database | PostgreSQL          |
| Infra    | Docker, Kubernetes  |

## Architecture

```
apps/           → Frontend applications
services/       → Backend microservices
packages/       → Shared libraries
```

## Key References

| Context              | File                            |
| -------------------- | ------------------------------- |
| Architecture         | `.ai/architecture.md`           |
| App: example-app     | `.ai/apps/example-app.md`       |
| Service: example     | `.ai/services/example-service.md` |
| Current Scope        | `.specs/apps/example-app/scopes/2026-Q1.md` |
| Current Tasks        | `.specs/apps/example-app/tasks/2026-Q1.md` |

## Policies (SSOT)

| Policy | Location                                |
| ------ | --------------------------------------- |
| CDD    | `docs/llm/policies/cdd.md`              |
| SDD    | `docs/llm/policies/sdd.md`              |
| ADD    | `docs/llm/policies/add.md`              |

## Quick Commands

```bash
pnpm dev          # Development
pnpm build        # Build all
pnpm test         # Run tests
```
