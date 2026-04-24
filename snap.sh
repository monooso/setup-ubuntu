#!/usr/bin/env bash
set -euo pipefail

# Install Snaps
echo "Installing Snap apps..."

snap install \
  brave \
  gradia \
  pomodorolm \
  todoist \
  transmission \
  wordbook

snap install ghostty --classic
