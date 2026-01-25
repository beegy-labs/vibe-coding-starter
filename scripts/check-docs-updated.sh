#!/bin/bash
# Enterprise SDD Documentation Check
# Ensures source code changes are accompanied by documentation updates

set -e

echo "🔍 Checking documentation compliance..."

# Get changed files (GitHub Actions or local)
if [[ -n "$GITHUB_BASE_REF" ]]; then
  git fetch origin "$GITHUB_BASE_REF" --depth=1
  CHANGED_FILES=$(git diff --name-only "origin/$GITHUB_BASE_REF"...HEAD)
else
  # Local: compare with main
  git fetch origin main --depth=1 2>/dev/null || true
  CHANGED_FILES=$(git diff --name-only origin/main...HEAD 2>/dev/null || git diff --name-only HEAD~1)
fi

# Categorize changes
SRC_CHANGED=$(echo "$CHANGED_FILES" | grep -E '^(apps|services|packages)/.*/src/' || true)
SPEC_CHANGED=$(echo "$CHANGED_FILES" | grep -E '^\.specs/' || true)
DOC_CHANGED=$(echo "$CHANGED_FILES" | grep -E '^docs/llm/' || true)
CONFIG_CHANGED=$(echo "$CHANGED_FILES" | grep -E '\.(json|yaml|yml|toml)$' || true)

# Check results
DOCS_UPDATED=false
if [[ -n "$SPEC_CHANGED" ]] || [[ -n "$DOC_CHANGED" ]]; then
  DOCS_UPDATED=true
fi

echo ""
echo "📊 Change Summary:"
echo "  Source files: $(echo "$SRC_CHANGED" | grep -c . || echo 0)"
echo "  Spec files:   $(echo "$SPEC_CHANGED" | grep -c . || echo 0)"
echo "  Doc files:    $(echo "$DOC_CHANGED" | grep -c . || echo 0)"
echo "  Config files: $(echo "$CONFIG_CHANGED" | grep -c . || echo 0)"
echo ""

# Enterprise validation rules
if [[ -n "$SRC_CHANGED" ]]; then
  if [[ "$DOCS_UPDATED" == "false" ]]; then
    echo "❌ ERROR: Source code changed but no documentation updated."
    echo ""
    echo "📝 Required action:"
    echo "   1. Create or update spec in .specs/{service}/active/"
    echo "   2. Or update relevant docs in docs/llm/"
    echo ""
    echo "📂 Changed source files:"
    echo "$SRC_CHANGED" | head -10
    if [[ $(echo "$SRC_CHANGED" | wc -l) -gt 10 ]]; then
      echo "   ... and more"
    fi
    echo ""
    echo "💡 Hint: If this is a quick fix, add to .specs/{service}/active/fixes/"
    exit 1
  else
    echo "✅ Documentation compliance check passed."
  fi
else
  echo "ℹ️  No source changes detected. Skipping documentation check."
fi

# Security check: warn if security-related files changed without security spec
SECURITY_PATTERNS="auth|password|token|secret|crypt|security|permission|access"
SECURITY_SRC=$(echo "$SRC_CHANGED" | grep -iE "$SECURITY_PATTERNS" || true)
SECURITY_SPEC=$(echo "$SPEC_CHANGED" | grep -E 'security/' || true)

if [[ -n "$SECURITY_SRC" ]] && [[ -z "$SECURITY_SPEC" ]]; then
  echo ""
  echo "⚠️  WARNING: Security-related code changed without security spec."
  echo "   Consider creating: .specs/{service}/active/security/{issue-name}/"
  echo ""
  echo "   Changed security files:"
  echo "$SECURITY_SRC"
fi

echo ""
echo "🎉 All checks completed."
exit 0
