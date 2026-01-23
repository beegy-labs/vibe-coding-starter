# Architecture Overview

> CDD Tier 1 - Architecture Context

## System Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                        Frontend                              │
│  ┌─────────────┐                                            │
│  │ example-app │  React + TypeScript                        │
│  └──────┬──────┘                                            │
└─────────┼───────────────────────────────────────────────────┘
          │ HTTP/REST
┌─────────┼───────────────────────────────────────────────────┐
│         ▼              Backend                               │
│  ┌─────────────────┐                                        │
│  │ example-service │  Node.js + TypeScript                  │
│  └────────┬────────┘                                        │
└───────────┼─────────────────────────────────────────────────┘
            │
┌───────────┼─────────────────────────────────────────────────┐
│           ▼           Database                               │
│    ┌────────────┐                                           │
│    │ PostgreSQL │                                           │
│    └────────────┘                                           │
└─────────────────────────────────────────────────────────────┘
```

## Package Dependencies

```
packages/shared
    ↑
    ├── apps/example-app
    └── services/example-service
```

## Directory Conventions

| Directory  | Purpose              | Example                    |
| ---------- | -------------------- | -------------------------- |
| `apps/`    | Frontend apps        | `apps/example-app/`        |
| `services/`| Backend services     | `services/example-service/`|
| `packages/`| Shared libraries     | `packages/shared/`         |

## Environment

| Env         | Purpose     |
| ----------- | ----------- |
| development | Local dev   |
| staging     | QA testing  |
| production  | Live        |
