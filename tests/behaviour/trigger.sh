#!/usr/bin/env bash
# Trigger test: plugin installed in a clean HOME; does Claude load the skill?
REPO="$(cd "$(dirname "$0")/../.." && pwd)"
H=$(mktemp -d); W=$(mktemp -d)
HOME=$H claude plugin marketplace add "$REPO" >/dev/null 2>&1
HOME=$H claude plugin install nanny-feynman@nanny-feynman >/dev/null 2>&1
while IFS='|' read -r expect prompt; do
  out=$(cd $W && HOME=$H timeout 240 claude -p "$prompt" --model sonnet --output-format stream-json --verbose --max-turns 3 </dev/null 2>/dev/null)
  if echo "$out" | grep -q '"name":"Skill"' && echo "$out" | grep -q 'nanny-feynman'; then got=yes; else got=no; fi
  echo "$expect|$got|$prompt"
done <<'P'
yes|quiz me on recursion
yes|summon Doris
yes|Can you test my understanding of how DNS works?
yes|I want Nanny Feynman to grill me on Big O
no|What's the capital of Australia?
no|Write a haiku about a cup of tea.
no|Explain how a hash table works.
no|Refactor this: def f(x): return x*2 if x>0 else x*2
no|My nan is from Croydon, any good pubs there?
P
