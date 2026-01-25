# Example App Context

> CDD Tier 1 - App Context

## Overview

React Todo application (connects to example-service)

## Tech Stack

| Tech | Purpose |
|------|---------|
| React 18+ | UI |
| TypeScript | Language |
| Vite | Build |
| TailwindCSS | Style |

## Structure (2026 Best Practices)

```
apps/example-app/src/
+-- components/    # UI components
+-- hooks/         # Custom hooks
+-- services/      # API client
+-- types/         # TypeScript types
+-- styles/        # Global styles
```

## Commands

```bash
pnpm --filter example-app dev    # localhost:5173
pnpm --filter example-app build
pnpm --filter example-app test
```

## API

```typescript
const API_BASE = import.meta.env.VITE_API_URL || 'http://localhost:8000';
```

## Current Work

See `.specs/example-todo/tasks/2026-S1/` (Task 02, 03)
