#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing Homebrew (if needed)..."
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing Homebrew packages..."
brew bundle --file="$DOTFILES_DIR/Brewfile"

echo "Installing Volta..."
if ! command -v volta &> /dev/null; then
    curl https://get.volta.sh | bash
fi

echo "Installing Bun..."
if ! command -v bun &> /dev/null; then
    curl -fsSL https://bun.sh/install | bash
fi

echo "Done! Run ./setup.sh to create symlinks."
