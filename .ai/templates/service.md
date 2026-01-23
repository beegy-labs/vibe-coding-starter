# Service Template

> Reference when creating new services

## Basic Structure

```
services/{service-name}/
├── src/
│   ├── controllers/
│   │   └── health.controller.ts
│   ├── services/
│   ├── repositories/
│   ├── middleware/
│   │   ├── error.middleware.ts
│   │   └── logging.middleware.ts
│   ├── utils/
│   └── index.ts
├── prisma/
│   └── schema.prisma
├── Dockerfile
├── package.json
└── tsconfig.json
```

## package.json Template

```json
{
  "name": "@example/{service-name}",
  "version": "0.0.1",
  "scripts": {
    "dev": "tsx watch src/index.ts",
    "build": "tsc",
    "start": "node dist/index.js",
    "test": "vitest",
    "lint": "eslint src/",
    "prisma:generate": "prisma generate"
  }
}
```

## Dockerfile Template

```dockerfile
FROM node:20-alpine AS builder
WORKDIR /app
COPY package.json pnpm-lock.yaml ./
RUN corepack enable && pnpm install --frozen-lockfile
COPY . .
RUN pnpm build

FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
EXPOSE 3000
CMD ["node", "dist/index.js"]
```

## Required Endpoints

```typescript
// GET /health
app.get('/health', (req, res) => {
  res.json({ status: 'ok', timestamp: new Date().toISOString() });
});
```
