# Vibe Coding Starter

> Enterprise-grade LLM-driven development template for senior developers

**A template for small teams of senior/lead developers to manage N projects with minimal headcount**

## Why Vibe Coding?

```
Traditional:  1 Project = 5-10 Developers
Vibe Coding:  N Projects = 2-3 Senior Developers + LLM Agents
```

### Core Philosophy

```
Human = Commander (Direction + Approval)
  - Explains what to build (not how)
  - Reviews and approves plans
  - Judges quality, makes decisions

LLM = Executor (Documentation + Implementation)
  - Writes all documentation
  - Generates task plans
  - Implements approved tasks
  - Updates knowledge base
```

### Target Audience

| Role | Responsibility | Projects |
|------|----------------|----------|
| **Tech Lead** | Architecture, direction | 3-5 |
| **Senior Dev** | Review, quality | 2-3 |
| **Platform Engineer** | Infrastructure, GitOps | Platform |

---

## Methodology: CDD + SDD + ADD

Three integrated methodologies for LLM-driven development:

```
CDD (Context)  -->  SDD (Specs)  -->  ADD (Execute)
    HOW               WHAT              DO
    |                  |                 |
    v                  v                 v
 Patterns          Task Plans        Implementation
 Knowledge         Roadmaps          Autonomous
 Context           Scopes            Supervised
```

| Phase | Methodology | Focus | Human Role | LLM Role |
|-------|-------------|-------|------------|----------|
| 1 | **CDD** | HOW (patterns) | Define patterns | Document, load |
| 2 | **SDD** | WHAT (tasks) | Explain, approve | Document, plan |
| 3 | **ADD** | DO (execute) | Approve, judge | Implement |

---

## CDD (Context-Driven Development)

> Constitution of Knowledge for LLM agents

CDD defines HOW LLM agents should work - patterns, conventions, context management.

### 4-Tier Structure

```
Tier 1: .ai/           --> Tier 2: docs/llm/  --> Tier 3: docs/en/  --> Tier 4: docs/{locale}/
[Pointers, <=50 lines]    [SSOT, <=300 lines]    [Generated]           [Translated]
[LLM-only]                [LLM-only]             [Human-readable]      [Human-readable]
```

| Tier | Path | Purpose | Editable | Audience |
|------|------|---------|----------|----------|
| 1 | `.ai/` | Quick pointers | Yes | LLM |
| 2 | `docs/llm/` | Full specs (SSOT) | Yes | LLM |
| 3 | `docs/en/` | Human docs | No (generated) | Human |
| 4 | `docs/{locale}/` | Translations | No (generated) | Human |

### Key Principles

1. **Token Efficiency**: Deliver more value per token
2. **Index-First**: Every directory has index.md for navigation
3. **ASCII-Only**: Tier 1-2 use ASCII only (no unicode)
4. **40% Budget**: Keep context under 40% of window

### Edit Flow

```
Human/LLM edits Tier 1/2 (SSOT)
         |
         v
    [batch job]
         |
         v
   Tier 3 generated (docs/en/)
         |
         v
   Tier 4 translated (docs/{locale}/)
```

**Never edit Tier 3/4 directly** - they will be overwritten.

---

## SDD (Spec-Driven Development)

> Human-commanded staged development

SDD defines WHAT to build through a 3-layer structure where **Human explains, LLM writes**.

### 3-Layer Structure

```
L1: roadmap.md      Human explains big picture --> LLM documents
L2: scopes/*.md     Human explains scope --> LLM documents
L3: tasks/{scope}/  Human requests plan --> LLM generates
```

| Layer | File | Human | LLM |
|-------|------|-------|-----|
| **L1 Roadmap** | roadmap.md | Explains big picture | Documents |
| **L2 Scope** | scopes/{id}.md | Explains implementation scope | Documents |
| **L3 Tasks** | tasks/{scope}/*.md | Requests + Approves | Generates plan |

### Workflow Example

```
Step 1 - Roadmap (L1):
  [Human] "Building mail service with login, signup, mail send/receive"
  [LLM]   --> Creates roadmap.md

Step 2 - Scope (L2):
  [Human] "Signup first. Google login + native login"
  [LLM]   --> Creates scopes/2026-scope1.md

Step 3 - Tasks (L3):
  [Human] "Plan Google Auth. Get name, email, age. Show parallel/sequential"
  [LLM]   --> Creates tasks/2026-scope1/
              - index.md (status, dependencies)
              - 01-google-auth.md (parallel)
              - 02-native-auth.md (parallel)
              - 03-integration.md (sequential, after 01+02)

Step 4 - Approval:
  [Human] "Approved" --> LLM executes
          "Revise X" --> LLM revises
```

### Feedback Loop

```
Execute --> Success --> Archive + Update CDD
        --> Failure --> Feedback Report --> Human decides:
                                            - "Revise scope" --> Re-plan
                                            - "Proceed" --> Retry
                                            - "Cancel" --> Archive
```

### Directory Structure

```
.specs/{target}/
+-- roadmap.md              # L1: Big picture
+-- scopes/
|   +-- 2026-scope1.md      # L2: Scope definition
+-- tasks/
|   +-- 2026-scope1/        # L3: Task plans
|       +-- index.md        # Status, dependencies
|       +-- 01-task-a.md    # Individual tasks
|       +-- 02-task-b.md
+-- history/                # Completed (90-day retention)
```

---

## ADD (Agent-Driven Development)

> Autonomous execution with human gates

ADD defines HOW agents execute approved SDD tasks.

### Core Flow

```
CDD (patterns) --referenced--> SDD (tasks) --executed--> ADD (implementation)
       ^                                                        |
       +----------------------- feedback -----------------------+
```

### Spec-First Validation

Before implementing, agent MUST check for existing spec:

```
User: "Implement X"
         |
         v
Read .specs/{service}/index.md
         |
    +----+----+
    |         |
 Found     Not Found
    |         |
    v         v
 Implement  "[!] Create spec first?"
```

### Execution Modes

| Mode | Description |
|------|-------------|
| Single Agent | One agent handles all tasks |
| Multi-Agent | Orchestrator distributes parallel tasks |
| Git Worktree | Isolated branches for parallel work |

### Self-Resolution Protocol

```
Problem encountered:
  1. Self-resolve (re-read CDD, search codebase, run tests)
  2. Peer consensus (if multi-agent)
  3. Incident report --> Human intervention

Human does NOT write code. Instead:
  - Update CDD (missing pattern)
  - Update SDD (unclear requirement)
  - Restart agent
```

### Experience Capitalization

```
Task completed --> Extract patterns --> Update CDD --> Future agents benefit
```

---

## Project Structure

```
vibe-coding-starter/
+-- .ai/                     # CDD Tier 1 (pointers, <=50 lines)
|   +-- README.md            # Entry point
|   +-- workflows/           # implementation, review, incident
|   +-- services/            # Service context
|   +-- apps/                # App context
|
+-- .specs/                  # SDD (3-layer structure)
|   +-- {target}/
|       +-- roadmap.md       # L1: Big picture
|       +-- scopes/          # L2: Scope definitions
|       +-- tasks/           # L3: Task plans
|       +-- history/         # Completed archive
|
+-- docs/llm/                # CDD Tier 2 (SSOT, <=300 lines)
|   +-- policies/            # cdd.md, sdd.md, add.md
|   +-- guides/              # Implementation guides
|   +-- references/          # External research
|
+-- docs/en/                 # CDD Tier 3 (generated)
+-- docs/{locale}/           # CDD Tier 4 (translated)
|
+-- apps/                    # Frontend applications
+-- services/                # Backend services
+-- packages/                # Shared packages
|
+-- infra/                   # GitOps (ArgoCD)
|   +-- clusters/            # Cluster configs
|   +-- apps/                # App deployments
|   +-- platform/            # Platform services
|   +-- infrastructure/      # Core infra
|
+-- AGENTS.md                # ADD router
+-- CLAUDE.md.example        # Claude-specific config
+-- GEMINI.md.example        # Gemini-specific config
```

---

## Getting Started

### 1. Clone & Setup

```bash
git clone https://github.com/beegy-labs/vibe-coding-starter.git my-project
cd my-project
pnpm install
```

### 2. Configure Agent

```bash
# For Claude Code
cp CLAUDE.md.example CLAUDE.md

# For Gemini CLI
cp GEMINI.md.example GEMINI.md
```

### 3. Start Development

Tell your LLM agent:
```
@.ai/README.md Read project context first.
```

### 4. Create Your First Spec

```
Human: "I'm building a user service with login, signup, profile management"
LLM:   --> Creates .specs/services/user-service/roadmap.md
```

---

## Multi-Project Workflow

A senior developer's day:

| Time | Activity | Tool |
|------|----------|------|
| 08:00 | Review PRs during commute | Mobile GitHub |
| 09:00 | Approve Project A spec | Claude Code |
| 10:00 | Review Project B architecture | IDE |
| 12:00 | Approve Project C deployment | ArgoCD |
| 14:00 | Code review for Project A | GitHub |
| 16:00 | Review Project D results | Claude Code |
| 18:00 | Assign next day's work | Mobile |

---

## Scaling Strategy

```
Phase 1: 1 Senior + LLM --> 1-2 Projects
Phase 2: 2 Seniors + LLM --> 3-5 Projects
Phase 3: 3 Seniors + Platform Engineer + LLM --> 5-10 Projects + Platform
```

---

## References

- [llm-dev-protocol](https://github.com/beegy-labs/llm-dev-protocol) - Policy source
- [Addy Osmani - LLM Coding Workflow 2026](https://addyosmani.com/blog/ai-coding-workflow/)
- [Anthropic - Building Effective Agents](https://www.anthropic.com/research/building-effective-agents)
- [Thoughtworks - Spec-Driven Development](https://www.thoughtworks.com/insights/blog/agile-engineering-practices/spec-driven-development-unpacking-2025-new-engineering-practices)

## License

MIT