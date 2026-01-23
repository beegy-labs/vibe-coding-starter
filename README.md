# Vibe Coding Starter

> Monorepo template for aggressive LLM delegation

A development methodology where senior developers manage 3-5 projects simultaneously, delegating non-creative tasks to LLMs.

## Core Philosophy

```
Human = Architect
  - Direction setting, quality verification, decision making

LLM = Implementer
  - Code writing, documentation, repetitive tasks
```

### Key Principles

**Expert time is the most expensive resource**
- All decisions protect the expert's creative flow state (Vibe)
- Output quality cannot exceed the creator's CS fundamentals
- Senior developers focus 100% on project direction and design

**Zero-Manual Coding (100% Automation)**
- Humans write zero lines of code or documentation
- Only approval and review - large-scale development possible via smartphone during commute

**Tool Independence & Portability**
- Multi-agent support without LLM lock-in
- Standard-based approach for seamless switching between Claude Code, Gemini CLI, etc.

## Methodology: CDD, SDD, ADD

| Phase | Methodology | Purpose | Location |
|-------|-------------|---------|----------|
| 1 | **CDD** | Context-Driven Development - LLM context awareness | `.ai/`, `docs/llm/` |
| 2 | **SDD** | Spec-Driven Development - LLM task generation | `.specs/` |
| 3 | **ADD** | Agent-Driven Development - LLM autonomous execution | `AGENTS.md` |

### Phase 1: CDD (Context-Driven Development)

Single Source of Truth (SSOT) and pattern repository for high-quality LLM output.

```
Tier 1: .ai/           → Entry point (≤50 lines), high-density management
Tier 2: docs/llm/      → SSOT detailed policies, ADR
Tier 3: docs/en/       → Human-readable (generated)
Tier 4: docs/{locale}/ → Translations (generated)
```

### Phase 2: SDD (Spec-Driven Development)

LLM auto-organizes senior's intent into layered documents.

```
L1: roadmap.md   (WHAT) → Feature spec & direction     [Human designs]
L2: scopes/*.md  (WHEN) → Work scope (Q1, Q2, etc.)    [Human defines]
L3: tasks/*.md   (HOW)  → Detailed implementation plan [LLM generates]
```

### Phase 3: ADD (Agent-Driven Development)

Agents execute approved designs from SDD.

- Current: Claude Code implements, Gemini CLI validates

## Project Structure

```
vibe-coding-starter/
│
├── .ai/                          # CDD Tier 1 (Context)
│   ├── README.md                 # Entry point (≤50 lines)
│   ├── architecture.md           # Architecture overview
│   ├── apps/                     # App-specific context
│   ├── services/                 # Service-specific context
│   └── templates/                # Generation templates
│
├── .specs/                       # SDD (Spec Management)
│   └── apps/example-app/
│       ├── roadmap.md            # L1: WHAT
│       ├── scopes/               # L2: WHEN
│       ├── tasks/                # L3: HOW
│       └── history/              # Completed archives
│
├── docs/
│   ├── llm/policies/             # CDD Tier 2 (synced from llm-dev-protocol)
│   ├── en/                       # CDD Tier 3 (generated)
│   └── kr/                       # CDD Tier 4 (translated)
│
├── apps/example-app/             # Frontend apps
├── services/example-service/     # Backend services
├── packages/shared/              # Shared packages
│
├── scripts/
│   ├── sync-protocol.sh          # Sync from llm-dev-protocol
│   └── docs/                     # Doc generation scripts
│
├── AGENTS.md                     # ADD configuration
├── package.json
├── pnpm-workspace.yaml
└── turbo.json
```

## Getting Started

### 1. Clone

```bash
git clone https://github.com/beegy-labs/vibe-coding-starter.git my-project
cd my-project
pnpm install
```

### 2. Sync Policies

```bash
pnpm sync:protocol
```

### 3. Customize Context

Edit `.ai/README.md` for your project

### 4. Define Specs

Create roadmap in `.specs/apps/`

### 5. Start Development

Reference `.ai/README.md` and `.specs/` with your LLM

## Example: Voice Output with Claude Code

Here's how to ask Claude Code to create a "Hello? Vibe Coding!" voice output:

### Prompt

```
@.ai/README.md Read the project context first.

Create a simple Node.js script that outputs "Hello? Vibe Coding!" as speech.

Requirements:
- Use say.js or similar TTS library
- TypeScript
- Add to packages/shared/src/hello-vibe.ts
- Include a test
```

### Expected Output

```typescript
// packages/shared/src/hello-vibe.ts
import say from 'say';

export const sayHelloVibe = (): Promise<void> => {
  return new Promise((resolve, reject) => {
    say.speak('Hello? Vibe Coding!', null, 1.0, (err) => {
      if (err) reject(err);
      else resolve();
    });
  });
};

// Run
sayHelloVibe().then(() => console.log('Done!'));
```

### Run

```bash
pnpm --filter shared add say
npx tsx packages/shared/src/hello-vibe.ts
# Speaks: "Hello? Vibe Coding!"
```

## Commute Strategy (Human No-Coding)

Agents code while you commute; you focus on review and approval.

| Time | Human | Agent |
|------|-------|-------|
| Morning commute | Approve design plan | Start implementation |
| At office | Business logic focus | PR ready for review |
| Evening commute | Review & feedback | Apply changes |

## Commands

```bash
# Sync policies from llm-dev-protocol
pnpm sync:protocol

# Check sync status
pnpm sync:protocol:check

# Generate docs (Tier 2 → Tier 3)
pnpm docs:generate --provider ollama

# Translate docs (Tier 3 → Tier 4)
pnpm docs:translate --locale kr

# Development
pnpm dev

# Build
pnpm build

# Test
pnpm test
```

## Future Roadmap: ADD Evolution

- **Multi-Terminal Orchestration**: Collect/coordinate n terminal agents for cross-validation
- **Autonomous Resolution**: AI agents reach consensus to self-resolve issues
- **Distillation**: Extract all trial-and-error to auto-update CDD
- **Local Agent Validation**: Nightly consistency checks between CDD and code

## References

- [llm-dev-protocol](https://github.com/beegy-labs/llm-dev-protocol) - Policy and script source

## License

MIT
