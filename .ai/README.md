# Vibe Coding Starter

> CDD Tier 1 - Entry Point (<=50 lines)

## Tech Stack

| Layer | Tech |
|-------|------|
| Frontend | React, TypeScript |
| Backend | Node.js, Rust |
| DB | PostgreSQL, ClickHouse, Valkey |

## Navigation

| Action | Read |
|--------|------|
| Current work | `.specs/{target}/tasks/` |
| Patterns | `docs/llm/policies/` |
| Workflows | `.ai/workflows/` |

## Methodology

| Phase | Location | Focus |
|-------|----------|-------|
| CDD | `.ai/`, `docs/llm/` | HOW (patterns) |
| SDD | `.specs/` | WHAT (tasks) |
| ADD | `AGENTS.md` | DO (execute) |

## SDD 3-Layer

| Layer | File | Human | LLM |
|-------|------|-------|-----|
| L1 | roadmap.md | Explains | Documents |
| L2 | scopes/*.md | Explains | Documents |
| L3 | tasks/{scope}/ | Requests | Generates |

## Policies

| Doc | Path |
|-----|------|
| CDD | `docs/llm/policies/cdd.md` |
| SDD | `docs/llm/policies/sdd.md` |
| ADD | `docs/llm/policies/add.md` |

## Commands

`pnpm dev` | `pnpm build` | `pnpm test`
