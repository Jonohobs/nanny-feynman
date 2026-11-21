#!/usr/bin/env bash
# Build ready-to-upload Nanny Feynman packages into dist/.
#
#   dist/nanny-feynman.zip        Skill bundle: Claude (desktop/web), ChatGPT Skills,
#                                 Grok Skills, Antigravity, Claude Code
#   dist/nanny-feynman-prompt.md  Plain system prompt (no frontmatter): ChatGPT custom GPTs
#                                 and Projects, Grok Projects, any other LLM
#
# Usage: scripts/package.sh
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
skill="$root/skills/nanny-feynman"
dist="$root/dist"
stage="$(mktemp -d)"
trap 'rm -rf "$stage"' EXIT

head -1 "$skill/SKILL.md" | grep -q '^---' || { echo "SKILL.md has no YAML frontmatter" >&2; exit 1; }

desc_len=$(sed -n 's/^description: //p' "$skill/SKILL.md" | head -1 | sed "s/^['\"]//; s/['\"]$//" | tr -d '\n' | wc -m)
if [ "$desc_len" -gt 200 ]; then
  echo "SKILL.md description is $((desc_len)) characters; Claude's skill upload allows 200" >&2
  exit 1
fi

rm -rf "$dist"
mkdir -p "$dist" "$stage/nanny-feynman"

# 1. Skill bundle: one top-level folder holding SKILL.md and its reference files.
cp "$skill"/{SKILL.md,doris.md,questions.md} "$root"/{LICENSE,NOTICE} "$stage/nanny-feynman/"
(cd "$stage" && zip -qr "$dist/nanny-feynman.zip" nanny-feynman)

# 2. Plain prompt: SKILL.md without its YAML frontmatter, plus a note about the
#    files it refers to, which these apps take as uploaded "knowledge" files.
{
  cat <<'NOTE'
You have two reference files: `doris.md` (Doris's full character sheet) and `questions.md` (the question bank). Use them as described below. If they are missing, carry on without them.
NOTE
  awk 'n >= 2 { print } /^---[[:space:]]*$/ && n < 2 { n++ }' "$skill/SKILL.md"
} > "$dist/nanny-feynman-prompt.md"

if ! grep -q '[^[:space:]]' <(tail -n +2 "$dist/nanny-feynman-prompt.md"); then
  echo "Generated prompt is empty: check SKILL.md frontmatter" >&2
  exit 1
fi

chars=$(wc -m < "$dist/nanny-feynman-prompt.md")
echo "Built:"
echo "  dist/nanny-feynman.zip"
echo "  dist/nanny-feynman-prompt.md ($((chars)) characters; custom GPT instructions allow 8000)"
if [ "$chars" -gt 8000 ]; then
  echo "WARNING: prompt is over 8000 characters and will not fit a custom GPT's Instructions box." >&2
  exit 1
fi
