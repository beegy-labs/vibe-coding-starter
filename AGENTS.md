# AGENTS.md

> Agent-Driven Development (ADD) Configuration | Multi-LLM Compatible

## Core Principle

```
Human = Architect - Direction setting, quality verification, decision making
LLM   = Implementer - Code writing, documentation, repetitive tasks
```

## Required References

Files to read before starting work:

| Priority | File | Purpose |
|----------|------|---------|
| 1 | `.ai/README.md` | Project overview |
| 2 | `.specs/apps/{app}/tasks/{scope}.md` | Current tasks |
| 3 | `docs/llm/policies/*.md` | Policies |

## Prohibited Actions

### Strictly Forbidden

- [ ] Committing directly to `main`/`develop` without user confirmation
- [ ] Modifying `.env`, secrets, or credentials
- [ ] Deploying production code without tests
- [ ] Committing generated files (`node_modules`, `dist`)
- [ ] Deleting existing code without confirmation (confirm before refactoring)

### Requires Approval

- [ ] Adding new dependencies
- [ ] Deleting files
- [ ] Architecture changes (must update `.ai/` docs simultaneously)

## Code Style

### TypeScript

```typescript
// ✅ Good
const getUserById = async (id: string): Promise<User> => {
  // ...
};

// ❌ Bad
async function getUserById(id) {
  // ...
}
```

### File Naming

| Type | Pattern | Example |
|------|---------|---------|
| Component | PascalCase | `UserProfile.tsx` |
| Utility | camelCase | `formatDate.ts` |
| Constants | SCREAMING_SNAKE | `API_ENDPOINTS.ts` |
| Test | *.test.ts | `formatDate.test.ts` |

## Commit Messages

```
<type>(<scope>): <subject>

types: feat, fix, docs, style, refactor, test, chore
scope: app name or package name
```

Examples:
```
feat(example-app): Add user profile page
fix(example-service): Fix authentication error handling
docs(readme): Update installation guide
```

## PR Rules

1. Branch naming: `feat/`, `fix/`, `docs/`, `refactor/`
2. Link related issues in PR description
3. Include self-review checklist

## Agent-Specific Configuration

### Claude Code

```
# Starting a project
@.ai/README.md Read the project context.

# Starting work
@.specs/apps/example-app/tasks/2026-Q1.md Read and proceed from Step 1.
```

### Gemini CLI

```bash
# Code review
gemini review --files "src/**/*.ts"
```

## Verification Checklist

After completing work:

- [ ] `pnpm lint` passes
- [ ] `pnpm test` passes
- [ ] `pnpm build` succeeds
- [ ] Related docs updated (.ai/, .specs/)
