# Decision: Tech Stack Selection

> **Date**: 2026-01-15 | **Status**: Accepted

## Context

Need to select frontend tech stack

## Options Considered

| Option | Pros | Cons |
| ------ | ---- | ---- |
| Next.js | SSR, Rich ecosystem | Complexity |
| Vite + React | Fast build, Simple | SSR requires extra setup |
| Remix | Web standards | Learning curve |

## Decision

Selected **Vite + React**

## Rationale

- Fast dev server startup
- Simple configuration
- Can add SSR later if needed

## Consequences

- SEO requires separate handling initially
- Starting with CSR-based approach
