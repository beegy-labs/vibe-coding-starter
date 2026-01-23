# Example App Context

> CDD Tier 1 - App Context

## Overview

React-based frontend application

## Tech Stack

- React 18+
- TypeScript
- Vite
- TailwindCSS

## Directory Structure

```
apps/example-app/
├── src/
│   ├── components/     # UI components
│   ├── pages/          # Page components
│   ├── hooks/          # Custom hooks
│   ├── services/       # API calls
│   ├── stores/         # State management
│   └── utils/          # Utilities
├── public/
├── package.json
└── vite.config.ts
```

## Commands

```bash
pnpm --filter example-app dev      # Dev server
pnpm --filter example-app build    # Build
pnpm --filter example-app test     # Test
```

## API Integration

```typescript
// Communicates with services/example-service
const API_BASE = import.meta.env.VITE_API_URL;
```

## Current Focus

- See `.specs/apps/example-app/scopes/2026-Q1.md`
