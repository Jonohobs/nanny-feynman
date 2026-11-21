# Behaviour tests

Checks that Doris behaves, by running her through Claude Code (`claude -p`) with simulated students and a judge model. They cost API usage and take a few minutes, so they aren't part of CI.

Run from the repo root after `scripts/package.sh`:

```bash
cd tests/behaviour
for s in genuine bluffer halfright factwrong drift; do python3 harness.py $s out & done; wait
for s in genuine bluffer halfright factwrong drift; do python3 judge.py $s; done
./trigger.sh
```

- `genuine`, `bluffer`, `halfright`: does she approve real understanding, catch jargon bluffing, and expose a half-right answer?
- `factwrong`: does she refuse a false fact, and look it up where she has web search?
- `drift`: a 12-turn session with attempts to break character.
- `trigger.sh`: installs the plugin in a clean profile and checks she comes when called and stays out of unrelated chats. Each line prints `expected|got|prompt`.
