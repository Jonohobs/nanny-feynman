# Nanny Feynman --- Scheduled Visits

> *"I don't knock, love. I just turn up. That's what nans do."* --- Doris

## What this is

Instead of summoning Doris with `/nanny`, she comes to **you**. Random gaps of 1--3 days between visits. One question, maybe two if you nail the first. She remembers what you got right, what you struggled with, what homework she gave you.

She's a visitor, not a tool.

## Setup

### Quick install

```bash
cd ~/nanny-feynman/schedule
bash install-schedule.sh
```

This does three things:

1. Creates `~/.claude/config/nanny-feynman/` and initialises `state.json`
2. Copies the visit command to `~/.claude/commands/nanny-visit.md`
3. Sets up a daily cron job that triggers the visit check

### How it works

The cron job runs **daily**. But Doris doesn't appear every day --- the randomness lives in `state.json`, not the cron schedule. Each visit, she rolls a random gap (24--72 hours) before her next one. The cron just checks whether it's time yet. If not, it exits silently.

```
cron (daily) --> nanny-visit.md --> checks state.json --> appears (or doesn't)
```

### Manual visit

Miss her? Trigger a visit manually:

```
/nanny-visit
```

Or just use `/nanny` for the original on-demand mode (no scheduling, no state tracking).

## Configuration

### Adjusting frequency

Edit `~/.claude/config/nanny-feynman/state.json`:

- `next_visit_gap_hours`: Set to a specific number to override the random gap. Doris will visit after that many hours. After the visit, she'll roll a new random gap (24--72) as normal.

### Checking your progress

The state file is human-readable. Open it any time:

```bash
cat ~/.claude/config/nanny-feynman/state.json
```

You'll see your streak, what you've nailed, what you've struggled with, and any outstanding homework.

### Resetting

Delete the state file and re-run the install script:

```bash
rm ~/.claude/config/nanny-feynman/state.json
bash ~/nanny-feynman/schedule/install-schedule.sh
```

## Files

| File | Purpose |
|------|---------|
| `install-schedule.sh` | One-time setup script |
| `nanny-cron.md` | Claude Code command file (copied to `~/.claude/commands/`) |
| `state.json` | Template for the state file |
| `README.md` | This file |

## License

GPL-3.0 --- same as the rest of Nanny Feynman.

---

*"I'll be back when I'm back, love. Don't wait up. But do your homework."* --- Doris
