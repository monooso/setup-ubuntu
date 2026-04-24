#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check we can sudo before doing anything
if ! sudo -v; then
    echo "Error: sudo access is required to run this setup." >&2
    exit 1
fi

# Keep sudo credentials alive for the duration of the script
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
SUDO_KEEPALIVE_PID=$!
trap 'kill "$SUDO_KEEPALIVE_PID" 2>/dev/null' EXIT

echo "=== Simple Setup ==="
echo ""

echo "--- Installing apt packages ---"
source "$SCRIPT_DIR/apt.sh"

echo ""
echo "--- Installing Snaps ---"
source "$SCRIPT_DIR/snap.sh"

echo ""
echo "--- Installing Homebrew and formulae ---"
source "$SCRIPT_DIR/homebrew.sh"

echo ""
echo "=== Setup complete ==="
