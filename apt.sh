#!/usr/bin/env bash
set -euo pipefail

# ----------------------------------------------------------
# NOTE:
# `apt` is a last resort. Wherever possible, use Homebrew.
# ----------------------------------------------------------

# Upgrade existing packages
echo "Upgrading system packages..."
sudo apt update && sudo apt upgrade -y

# Install 1Password
echo "Installing 1Password..."
wget -O /tmp/1password.deb https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb
sudo apt install -y /tmp/1password.deb
rm /tmp/1password.deb

# Install essential tools
echo "Installing essential tools..."
sudo dnf install -y \
  curl \
  fish \
  gcc \
  git \
  stow \
  wl-clipboard

# Install build dependencies for Homebrew and Erlang
echo "Installing build dependencies..."
sudo apt install -y build-essential gcc

# Install Mullvad
# - Download the signing key
sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc

# - Add the repository server to apt
echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable stable main" | sudo tee /etc/apt/sources.list.d/mullvad.list

# - Install the package
sudo apt update && sudo apt install -y mullvad-vpn

