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

echo "Installing try-rs..."
cargo install try-rs

echo "Installing git-worktree-runner..."
GTR_DIR="$HOME/.local/share/git-worktree-runner"
if [ ! -d "$GTR_DIR" ]; then
    git clone https://github.com/coderabbitai/git-worktree-runner.git "$GTR_DIR"
fi
git -C "$GTR_DIR" pull
"$GTR_DIR/install.sh"

echo "Done! Run ./setup.sh to create symlinks."
