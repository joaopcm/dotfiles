#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Syncing preferences to repo..."

# BetterDisplay
cp ~/Library/Preferences/pro.betterdisplay.BetterDisplay.plist "$DOTFILES_DIR/preferences/"
plutil -convert xml1 "$DOTFILES_DIR/preferences/pro.betterdisplay.BetterDisplay.plist"

# Mac Mouse Fix
cp ~/Library/Preferences/com.nuebling.mac-mouse-fix.plist "$DOTFILES_DIR/preferences/"
plutil -convert xml1 "$DOTFILES_DIR/preferences/com.nuebling.mac-mouse-fix.plist"

echo "Done. Review changes with: git diff"
