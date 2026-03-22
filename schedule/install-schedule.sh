#!/usr/bin/env bash
# Nanny Feynman — Scheduled Visit Installer
# Sets up Doris to visit on her own schedule (1-3 day random gaps).
#
# Author: Jonathan Hobman + Claude Code
# License: GPL-3.0
#
# Usage: bash install-schedule.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.claude/config/nanny-feynman"
COMMANDS_DIR="$HOME/.claude/commands"
STATE_FILE="$CONFIG_DIR/state.json"
COMMAND_FILE="$COMMANDS_DIR/nanny-visit.md"

echo "=== Nanny Feynman — Scheduled Visit Setup ==="
echo ""

# --- 1. Create config directory ---
if [ ! -d "$CONFIG_DIR" ]; then
    mkdir -p "$CONFIG_DIR"
    echo "[+] Created config directory: $CONFIG_DIR"
else
    echo "[=] Config directory already exists: $CONFIG_DIR"
fi

# --- 2. Initialize state file ---
if [ ! -f "$STATE_FILE" ]; then
    cat > "$STATE_FILE" << 'STATEEOF'
{
  "last_visit": null,
  "next_visit_gap_hours": 24,
  "questions_asked": [],
  "questions_nailed": [],
  "questions_struggled": [],
  "homework": null,
  "homework_topic": null,
  "streak": 0,
  "total_visits": 0,
  "last_project_context": null
}
STATEEOF
    echo "[+] Initialized state file: $STATE_FILE"
else
    echo "[=] State file already exists (preserving your progress): $STATE_FILE"
fi

# --- 3. Copy command file ---
if [ ! -d "$COMMANDS_DIR" ]; then
    mkdir -p "$COMMANDS_DIR"
    echo "[+] Created commands directory: $COMMANDS_DIR"
fi

cp "$SCRIPT_DIR/nanny-cron.md" "$COMMAND_FILE"
echo "[+] Installed visit command: $COMMAND_FILE"

# --- 4. Set up cron job (daily check) ---
CRON_COMMENT="# nanny-feynman scheduled visit check"
CRON_CMD="claude /nanny-visit"

# Check if cron is available
if command -v crontab &> /dev/null; then
    # Check if the cron job already exists
    if crontab -l 2>/dev/null | grep -q "nanny-feynman"; then
        echo "[=] Cron job already exists"
    else
        # Add a daily cron job at a random hour (9-18) to feel organic
        HOUR=$(( RANDOM % 10 + 9 ))
        MINUTE=$(( RANDOM % 60 ))
        (crontab -l 2>/dev/null || true; echo "$CRON_COMMENT"; echo "$MINUTE $HOUR * * * $CRON_CMD") | crontab -
        echo "[+] Added daily cron job (runs at $HOUR:$(printf '%02d' $MINUTE) each day)"
        echo "    The cron triggers the check — Doris decides whether to actually appear."
    fi
else
    echo ""
    echo "[!] crontab not available on this system."
    echo "    You can trigger visits manually with: /nanny-visit"
    echo "    Or set up a Task Scheduler entry (Windows) to run: claude /nanny-visit"
    echo ""
    echo "    Windows Task Scheduler setup:"
    echo "    1. Open Task Scheduler (taskschd.msc)"
    echo "    2. Create Basic Task -> 'Nanny Feynman Visit'"
    echo "    3. Trigger: Daily"
    echo "    4. Action: Start a program"
    echo "       Program: claude"
    echo "       Arguments: /nanny-visit"
    echo "    5. Finish"
fi

echo ""
echo "=== Setup complete ==="
echo ""
echo "Doris will start visiting within 24 hours."
echo "Or trigger a visit now with: /nanny-visit"
echo ""
echo "Your progress is tracked in: $STATE_FILE"
echo "  - Questions nailed, questions struggled, homework, streak"
echo "  - All human-readable. Peek any time."
echo ""
echo "\"Right then, love. I'll see you when I see you.\" — Doris"
