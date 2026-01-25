# Architecture Overview

> Tier 1 - Architecture Context (<=50 lines)

## System Layers

```
Frontend (apps/)     -> HTTP/REST -> Backend (services/)
                                          |
                                          v
                                     Database (PostgreSQL)
```

## Package Dependencies

```
packages/shared
    ^
    +-- apps/*
    +-- services/*
```

## Directory Conventions

| Directory | Purpose | Example |
|-----------|---------|---------|
| `apps/` | Frontend | `apps/example-app/` |
| `services/` | Backend | `services/example-service/` |
| `packages/` | Shared | `packages/shared/` |

## Environments

| Env | Purpose |
|-----|---------|
| development | Local dev |
| staging | QA testing |
| production | Live |

## Infrastructure

| Component | Location |
|-----------|----------|
| GitOps | `infra/` |
| Clusters | `infra/clusters/` |
| Platform | `infra/platform/` |
