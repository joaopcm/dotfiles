# dotfiles

macOS dev environment configs.

## What's Included

| Tool | Config |
|------|--------|
| fish | shell, aliases, tool inits |
| git | GPG signing via 1Password, aliases |
| starship | prompt |
| aerospace | tiling window manager |
| claude | Claude Code settings + rules |
| BetterDisplay | display management |
| Mac Mouse Fix | mouse customization |

## Setup

```bash
# Install tools
./install.sh

# Create symlinks + set fish as default shell
./setup.sh

# Apply macOS preferences (optional)
./macos.sh
```

## Sync

After changing BetterDisplay or Mac Mouse Fix settings:
```bash
./sync.sh
```

## macOS Preferences

`macos.sh` configures:
- Dock: autohide, size, no recents
- Finder: column view, folders first, show extensions, snap to grid
- Keyboard: fast key repeat, no auto-correct
- Trackpad: tap to click, traditional scroll direction
- Menu bar: battery %, 24h clock
- Display scaling via `displayplacer`
- Reduce motion, no .DS_Store on network/USB

## Requirements

- macOS
- 1Password with CLI enabled

## Structure

```
├── Brewfile              # homebrew packages
├── install.sh            # install tools
├── setup.sh              # symlink configs
├── macos.sh              # macOS preferences
├── sync.sh               # sync app settings to repo
├── fish/config.fish
├── git/{config,ignore}
├── starship/starship.toml
├── aerospace/aerospace.toml
├── claude/{settings.json,CLAUDE.md,rules/,file-suggestion.sh}
└── preferences/{BetterDisplay,MacMouseFix}.plist
```
