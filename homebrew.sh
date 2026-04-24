#!/usr/bin/env bash
set -euo pipefail

# Install Homebrew (idempotent)
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to path to complete setup
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install CLI tools
echo "Installing Homebrew formulae..."
brew install \
    bat \
    fd \
    fzf \
    gh \
    lazygit \
    mise \
    neovim \
    ripgrep \
    starship \
    tree-sitter-cli
