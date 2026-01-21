#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
    local src="$1"
    local dst="$2"

    mkdir -p "$(dirname "$dst")"

    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        echo "Backing up $dst to $dst.backup"
        mv "$dst" "$dst.backup"
    fi

    if [ -L "$dst" ]; then
        rm "$dst"
    fi

    ln -s "$src" "$dst"
    echo "Linked $dst -> $src"
}

echo "Creating symlinks..."

link "$DOTFILES_DIR/fish/config.fish" "$HOME/.config/fish/config.fish"
link "$DOTFILES_DIR/git/config" "$HOME/.gitconfig"
link "$DOTFILES_DIR/git/ignore" "$HOME/.config/git/ignore"
link "$DOTFILES_DIR/starship/starship.toml" "$HOME/.config/starship.toml"
link "$DOTFILES_DIR/aerospace/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"
link "$DOTFILES_DIR/claude/settings.json" "$HOME/.claude/settings.json"
link "$DOTFILES_DIR/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
link "$DOTFILES_DIR/claude/rules" "$HOME/.claude/rules"
link "$DOTFILES_DIR/claude/file-suggestion.sh" "$HOME/.claude/file-suggestion.sh"
link "$DOTFILES_DIR/lazygit/config.yml" "$HOME/Library/Application Support/lazygit/config.yml"
link "$DOTFILES_DIR/lazydocker/config.yml" "$HOME/Library/Application Support/jesseduffield/lazydocker/config.yml"
link "$DOTFILES_DIR/wtf/config.yml" "$HOME/.config/wtf/config.yml"
link "$DOTFILES_DIR/try-rs/config.toml" "$HOME/Library/Application Support/try-rs/config.toml"

chmod +x "$DOTFILES_DIR/claude/file-suggestion.sh"

echo "Importing app preferences..."
# BetterDisplay
cp "$DOTFILES_DIR/preferences/pro.betterdisplay.BetterDisplay.plist" "$HOME/Library/Preferences/"
# Mac Mouse Fix
cp "$DOTFILES_DIR/preferences/com.nuebling.mac-mouse-fix.plist" "$HOME/Library/Preferences/"

echo "Setting fish as default shell..."
FISH_PATH="$(which fish)"
if ! grep -q "$FISH_PATH" /etc/shells; then
    echo "$FISH_PATH" | sudo tee -a /etc/shells
fi
chsh -s "$FISH_PATH"

echo "Done!"
