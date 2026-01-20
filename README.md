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

## Setup

```bash
# Install tools
./install.sh

# Create symlinks + set fish as default shell
./setup.sh
```

## Requirements

- macOS
- 1Password with CLI enabled

## Structure

```
├── Brewfile              # homebrew packages
├── install.sh            # install tools
├── setup.sh              # symlink configs
├── fish/config.fish
├── git/{config,ignore}
├── starship/starship.toml
├── aerospace/aerospace.toml
└── claude/{settings.json,CLAUDE.md,rules/,file-suggestion.sh}
```
