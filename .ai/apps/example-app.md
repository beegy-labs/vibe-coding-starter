# Example App Context

> CDD Tier 1 - App Context

## Overview

React frontend application

## Tech Stack

| Tech | Purpose |
|------|---------|
| React 18+ | UI |
| TypeScript | Language |
| Vite | Build |
| TailwindCSS | Style |

## Structure

```
apps/example-app/
+-- src/{components,pages,hooks,services,stores}/
+-- public/
+-- vite.config.ts
```

## Commands

```bash
pnpm --filter example-app dev
pnpm --filter example-app build
pnpm --filter example-app test
```

## API

```typescript
const API_BASE = import.meta.env.VITE_API_URL;
```

## Current Work

See `.specs/apps/example-app/tasks/`
