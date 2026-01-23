# Example Service Context

> CDD Tier 1 - Service Context

## Overview

Node.js-based backend service

## Tech Stack

- Node.js 20+
- TypeScript
- Express / Fastify
- Prisma (ORM)
- PostgreSQL

## Directory Structure

```
services/example-service/
├── src/
│   ├── controllers/    # Request handlers
│   ├── services/       # Business logic
│   ├── repositories/   # Data access
│   ├── middleware/     # Middleware
│   ├── utils/          # Utilities
│   └── index.ts        # Entry point
├── prisma/
│   └── schema.prisma   # DB schema
├── package.json
└── Dockerfile
```

## Commands

```bash
pnpm --filter example-service dev      # Dev server
pnpm --filter example-service build    # Build
pnpm --filter example-service test     # Test
pnpm --filter example-service prisma:generate  # Generate Prisma client
```

## API Endpoints

| Method | Path         | Description  |
| ------ | ------------ | ------------ |
| GET    | /health      | Health check |
| GET    | /api/v1/...  | API endpoints |

## Environment Variables

```bash
DATABASE_URL=postgresql://...
PORT=3000
NODE_ENV=development
```
