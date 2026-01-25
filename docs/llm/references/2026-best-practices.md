# 2026 LLM-Driven Development Best Practices

> Research summary for CDD/SDD/ADD architecture | **Updated**: 2026-01-25

## Research Metadata

```yaml
# Refresh Configuration
refresh:
  schedule: quarterly          # quarterly, monthly, on-demand
  last_updated: 2026-01-25
  next_review: 2026-04-25

# Search Queries for Re-research
queries:
  context_engineering:
    - "LLM context window optimization 2026 best practices"
    - "context rot LLM performance degradation"
    - "Anthropic context engineering agents"
  tokenization:
    - "LLM tokenization Unicode vs ASCII performance"
    - "BPE tokenizer efficiency special characters"
    - "LLM token optimization techniques"
  spec_driven:
    - "spec-driven development AI 2026"
    - "AGENTS.md CLAUDE.md best practices"
  agent_patterns:
    - "multi-agent LLM patterns 2026"
    - "agentic development trends"

# Validation Checklist
validation:
  - Check if sources are still accessible
  - Verify claims with latest model releases
  - Update token counts for new tokenizers
  - Review context window sizes for current models
```

## Sources

### Context Engineering
- [Anthropic - Effective Context Engineering](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)
- [Chroma Research - Context Rot](https://research.trychroma.com/context-rot)
- [Redis - Context Rot Prevention](https://redis.io/blog/context-rot/)

### Tokenization
- [DZone - Token Tricks That Work](https://dzone.com/articles/llm-tokenization-costs-performance)
- [Fast.ai - GPT Tokenizer Guide](https://www.fast.ai/posts/2025-10-16-karpathy-tokenizers)
- [DEV - Why LLMs Hallucinate on Emojis](https://dev.to/klement_gunndu_e16216829c/why-llms-hallucinate-on-emojis-and-4-tokens-that-break-production-ai-3d44)

### Spec-Driven Development
- [Addy Osmani - LLM Coding Workflow 2026](https://addyosmani.com/blog/ai-coding-workflow/)
- [GitHub Blog - Spec-driven Development with AI](https://github.blog/ai-and-ml/generative-ai/spec-driven-development-with-ai-get-started-with-a-new-open-source-toolkit/)
- [Anthropic - Building Effective Agents](https://www.anthropic.com/research/building-effective-agents)

---

## 1. Context Engineering

### Core Principle

> "Context engineering is the delicate art and science of filling the context window with just the right information." - Andrej Karpathy

> "Find the smallest set of high-signal tokens that maximize the likelihood of some desired outcome." - Anthropic

### Context Rot (Performance Degradation)

| Finding | Source | Impact |
|---------|--------|--------|
| All 18 SOTA models degrade with long context | Chroma Research | Confirmed |
| Position 1 = 75% accuracy, Position 10 = 55% | Stanford | -20% accuracy |
| Hallucinations increase 3-5x with rare tokens | DEV Community | High risk |

**Lost-in-the-Middle Effect:**
```
Context recall by position:
+-- First 20%:  HIGH recall (primacy bias)
+-- Middle 60%: LOW recall (lost-in-the-middle)
+-- Last 10%:   HIGH recall (recency bias)
```

### Mitigation Strategies

| Strategy | Description | Adoption |
|----------|-------------|----------|
| Compaction | Summarize history, reinitialize context | High |
| Structured Notes | External memory, selective retrieval | High |
| Hybrid Retrieval | Pre-load + just-in-time fetch | Growing |
| Index-First | Load minimal pointers, expand on demand | Recommended |

---

## 2. Token Optimization

### ASCII vs Unicode

| Character Type | Bytes | Tokens | Hallucination Risk |
|----------------|-------|--------|-------------------|
| ASCII letter | 1 | 1 | Baseline |
| Japanese char | 3 | 1 | Low |
| Emoji | 4 | 2-3 | **3-5x higher** |
| Box-drawing | 3 | 1-2 | Medium |
| Rare Unicode | 1-4 | 1-4+ | **High** |

> "Avoid fancy quotes, hairline spaces, and deep Unicode indentation which balloon into byte junk. Prefer ASCII tables to box-drawing characters." - DZone

### Optimization Impact

| Technique | Token Savings | Reliability Impact |
|-----------|---------------|-------------------|
| Index-first pattern | 60-80% | High |
| Tables over prose | 30-50% | Medium |
| Tiered loading | 40-60% | High |
| ASCII-only | 2-5% | **High (fewer hallucinations)** |
| YAML over JSON | 10-20% | Low |

### Why ASCII Matters

```
Unicode special char -> UTF-8 encoding -> Multiple bytes
-> BPE splits into byte tokens -> "Rare token"
-> Less training data -> More hallucinations

Example: 50 emojis tested, 12 consistently broke Claude reasoning
```

---

## 3. Spec-First Development

> "Instead of coding first and writing docs later, you start with a spec--a contract for how your code should behave that becomes the source of truth for AI agents."

### Key Practices

| Practice | Description | Adoption |
|----------|-------------|----------|
| Spec as SSOT | Specification is source of truth | High |
| Agent context files | AGENTS.md, CLAUDE.md, GEMINI.md | High |
| Pre-implementation validation | Check spec before coding | Growing |
| CI documentation gates | Block PRs without doc updates | Recommended |

---

## 4. Agent Patterns

### Supervised Autonomy

> "Use these tools in a supervised way: let them generate and even run code, but keep an eye on each step." - Addy Osmani

| Pattern | Description |
|---------|-------------|
| Human approval gates | Review at key checkpoints |
| Incremental execution | Small steps over big-bang |
| Self-resolution first | Agent tries before escalating |
| Peer consensus | Multi-agent cross-validation |

### Parallel Agent Workflows

```
Main Agent (Orchestrator)
    |
    +-- Agent 1 (Task A) --[worktree-a]
    +-- Agent 2 (Task B) --[worktree-b]
    +-- Agent 3 (Task C) --[worktree-c]
```

- Git worktrees for isolation
- Branch-per-task strategy
- Merge back when complete

---

## 5. Key Quotes

### Andrej Karpathy
> "Context engineering is the delicate art and science of filling the context window with just the right information."

### Anthropic
> "Find the simplest solution possible, and only increase complexity when needed."

### Addy Osmani
> "If you ask for too much in one go, the LLM is likely to get confused or produce a 'jumbled mess.' Split the problem into smaller pieces."

### Simon Willison
> "Think of an LLM pair programmer as 'over-confident and prone to mistakes.'"

---

## 6. Popular Frameworks (2026)

| Framework | Focus | Use Case |
|-----------|-------|----------|
| Claude Code | CLI coding assistant | Implementation |
| Gemini CLI | Multi-modal coding | Documentation |
| GitHub Spec Kit | Spec-driven development | Spec management |
| CrewAI | Multi-agent orchestration | Team simulation |
| LangGraph | Stateful agent workflows | Complex flows |

---

## Refresh Protocol

When refreshing this document:

```yaml
steps:
  1_search:
    - Run queries from metadata section
    - Use WebSearch tool for each query
    - Collect new findings

  2_validate:
    - Check existing sources still accessible
    - Verify claims against latest research
    - Update statistics if changed

  3_update:
    - Add new findings to relevant sections
    - Update "last_updated" in metadata
    - Set "next_review" date
    - Commit with message: "docs: Refresh 2026 best practices"

  4_propagate:
    - Check if CDD policy needs updates
    - Update any affected workflows
```
