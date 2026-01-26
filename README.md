# Vibe Coding Starter

> Enterprise-grade LLM-driven development template for senior developers

---

## 1. The Vision

### The Problem

```
Traditional Development:
  1 Project = 5-10 Developers
  - Extensive documentation overhead
  - Communication bottlenecks
  - Context switching costs
```

### The Solution

```
Vibe Coding:
  N Projects = 2-3 Senior Developers + LLM Agents
  - LLM handles documentation
  - Human focuses on decisions
  - Scalable across projects
```

### Core Philosophy

```
Human = Commander
  - Explains what to build (not how)
  - Reviews and approves plans
  - Judges quality, makes decisions

LLM = Executor
  - Writes all documentation
  - Generates task plans
  - Implements approved tasks
  - Updates knowledge base
```

### Target Audience

| Role | Responsibility | Concurrent Projects |
|------|----------------|---------------------|
| **Tech Lead** | Architecture, direction | 3-5 |
| **Senior Dev** | Review, quality | 2-3 |
| **Platform Engineer** | Infrastructure, GitOps | Platform-wide |

---

## 2. The Core Engine

Three integrated methodologies power LLM-driven development:

```
CDD (Context)  -->  SDD (Specs)  -->  ADD (Execute)
    HOW               WHAT              DO
```

### CDD (Context-Driven Development)

**Goal**: Provide LLM agents with consistent patterns and project knowledge.

**Role**: Constitution of knowledge. Defines HOW agents should work through a 4-Tier documentation structure.

**Key Principle**: Token efficiency - deliver maximum value per token consumed.

> Details: [docs/llm/policies/cdd.md](docs/llm/policies/cdd.md)

### SDD (Spec-Driven Development)

**Goal**: Transform human's ambiguous ideas into clear, executable specs.

**Role**: Human-commanded staged development. Defines WHAT to build through 3 layers:
- L1 Roadmap: Big picture
- L2 Scope: Implementation boundaries
- L3 Tasks: Executable work items

**Key Principle**: Human explains, LLM writes. Never the reverse.

> Details: [docs/llm/policies/sdd.md](docs/llm/policies/sdd.md)

### ADD (Agent-Driven Development)

**Goal**: Enable autonomous execution while maintaining human control.

**Role**: Spec-first validation and self-resolution. Defines HOW agents execute approved tasks.

**Key Principle**: Spec-first - always check for existing specs before implementing.

> Details: [docs/llm/policies/add.md](docs/llm/policies/add.md)

---

## 3. The Blueprint

### Project Structure

```
vibe-coding-starter/
+-- .ai/                     # CDD Tier 1: Quick pointers (<=50 lines)
|   +-- README.md            # Entry point for LLM
|   +-- workflows/           # implementation, review, incident
|   +-- services/            # Service-specific context
|   +-- apps/                # App-specific context
|
+-- .specs/                  # SDD: 3-layer specs per app
|   +-- {app-name}/          # One spec per app/software
|       +-- roadmap.md       # L1: Big picture
|       +-- scopes/          # L2: Scope definitions
|       +-- tasks/           # L3: Task plans
|       +-- history/         # Completed archive
|
+-- docs/llm/                # CDD Tier 2: Full methodology specs (<=300 lines)
|   +-- policies/            # cdd.md, sdd.md, add.md
|   +-- guides/              # Implementation guides
|
+-- apps/                    # Frontend applications
+-- services/                # Backend services
+-- packages/                # Shared packages
|
+-- infra/                   # Enterprise Blueprint (see below)
|
+-- AGENTS.md                # ADD router for LLM agents
```

### Directory Purposes

| Directory | Purpose | Audience |
|-----------|---------|----------|
| `.ai/` | Quick context pointers, token-optimized | LLM |
| `.specs/` | Development specs (roadmap, scope, tasks) | LLM + Human |
| `docs/llm/` | Full methodology specs (SSOT) | LLM |
| `apps/`, `services/` | Implementation code | Human + LLM |

### About `infra/` (Enterprise Blueprint)

This directory is **not for immediate execution** but serves as a high-quality **blueprint** demonstrating enterprise-grade GitOps patterns.

It shows how application code and infrastructure code coexist in a mature DevOps monorepo:

```
infra/
+-- clusters/            # Cluster configurations
+-- apps/                # Application deployments
+-- platform/            # Platform services (monitoring, CI/CD)
+-- infrastructure/      # Core infrastructure
```

For senior developers, this blueprint provides a valuable template that can be directly applied or adapted to production environments.

---

## 4. The First Engagement

Experience the CDD -> SDD -> ADD cycle using Claude Code.

### Prerequisites

```bash
git clone https://github.com/beegy-labs/vibe-coding-starter.git my-project
cd my-project
```

### Tutorial: Create and Execute Your First Spec

**Step 1: Initialize Claude Code**

```bash
claude
```

Then configure your agent:

```
Read @AGENTS.md and create CLAUDE.md for this project.
```

**Step 2: Create Roadmap (SDD L1)**

Tell Claude Code what you want to build:

```
I want to build a hash utility service.
Features: SHA256 hash generation, input validation.
Tech stack: Rust with Axum.
Create the roadmap in .specs/hash-service/
```

The roadmap.md will include a Tech Stack table with implementation locations (e.g., `services/`, `apps/`).

**Step 3: Define Scope (SDD L2)**

Define implementation scope:

```
First scope: basic hash endpoint.
- GET /hash?input=text returns SHA256 hash
- Input validation (non-empty, max 1000 chars)
Create scope in .specs/hash-service/scopes/2026-S1.md
```

**Step 4: Generate Tasks (SDD L3)**

Request task breakdown:

```
Plan the implementation with parallel/sequential tasks.
Show dependencies clearly.
Include project setup task with target directory.
Create tasks in .specs/hash-service/tasks/2026-S1/
```

LLM generates tasks including:
- `01-project-setup.md`: Create `services/hash-service/` with Cargo.toml
- `02-core-logic.md`: Implement hash function
- `03-api-endpoint.md`: Create /hash endpoint
- `04-testing.md`: Write tests
- `05-cdd-update.md`: Update CDD T1 (.ai/) and T2 (docs/llm/)
- `06-archive.md`: Move completed tasks to history/

**Step 5: Review and Approve**

Review the generated tasks, **especially the target directory in setup task**:

```
# Check tasks - verify service location is correct
Read .specs/hash-service/tasks/2026-S1/

# If location is wrong, request revision
# If correct, approve
Approved. Implement all tasks.
```

Human reviews and approves the implementation plan including service location.

**Step 6: Verify Results**

After implementation:

```bash
cd services/hash-service

# Run tests
cargo test

# Start server
cargo run

# Test endpoint (in another terminal)
curl "http://localhost:3000/hash?input=hello"
```

**Step 7: Complete the Cycle (Already in Tasks)**

CDD update and archive are **already planned in tasks** (05-cdd-update.md, 06-archive.md).

When LLM executes all tasks, it will:
- Create `.ai/services/hash-service.md` (T1 pointer)
- Update `.ai/services/index.md`
- Update `docs/llm/guides/` if new patterns (T2 SSOT)
- Move completed tasks to `.specs/hash-service/history/2026-S1/`

All documentation is written by LLM. Human only explains and approves.

### Quick Reference

| Phase | Claude Code Prompt |
|-------|-------------------|
| Load context | `Read @.ai/README.md` |
| Create roadmap | `I want to build X. Create roadmap in .specs/X/` |
| Define scope | `First scope: Y. Create scope.` |
| Generate tasks | `Plan tasks including setup, implementation, CDD update, and archive.` |
| Review | `Read .specs/X/tasks/ and verify plan` |
| Execute | `Approved. Implement all tasks.` |

Note: CDD update (T1/T2) and archive are included in generated tasks, not separate steps.

---

## References

- [llm-dev-protocol](https://github.com/beegy-labs/llm-dev-protocol) - Policy source
- [Anthropic - Building Effective Agents](https://www.anthropic.com/research/building-effective-agents)
- [Thoughtworks - Spec-Driven Development](https://www.thoughtworks.com/insights/blog/agile-engineering-practices/spec-driven-development-unpacking-2025-new-engineering-practices)

## License

MIT
