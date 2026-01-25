# Example Service Context

> Tier 1 - Service Context

## Overview

Node.js backend service with PostgreSQL

## Tech Stack

| Tech | Purpose |
|------|---------|
| Node.js 20+ | Runtime |
| TypeScript | Language |
| Prisma | ORM |
| PostgreSQL | Database |

## Structure

```
services/example-service/
+-- src/{controllers,services,repositories}/
+-- prisma/schema.prisma
+-- Dockerfile
```

## Commands

```bash
pnpm --filter example-service dev
pnpm --filter example-service build
pnpm --filter example-service test
```

## Endpoints

| Method | Path |
|--------|------|
| GET | /health |
| GET | /api/v1/* |

## Current Work

See `.specs/services/example-service/index.md`
