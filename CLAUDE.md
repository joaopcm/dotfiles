# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
./install.sh   # install homebrew packages, volta, bun
./setup.sh     # symlink configs + set fish as default shell
./macos.sh     # apply macOS system preferences
./sync.sh      # sync app settings (BetterDisplay, Mac Mouse Fix) back to repo
```

## Architecture

Dotfiles repo for macOS. Each tool has its own directory with config files. `setup.sh` symlinks them to expected locations.

**Symlink targets:**
- `fish/config.fish` → `~/.config/fish/config.fish`
- `git/{config,ignore}` → `~/.gitconfig`, `~/.config/git/ignore`
- `starship/starship.toml` → `~/.config/starship.toml`
- `aerospace/aerospace.toml` → `~/.config/aerospace/aerospace.toml`
- `claude/*` → `~/.claude/`
- `lazygit/config.yml` → `~/Library/Application Support/lazygit/config.yml`
- `lazydocker/config.yml` → `~/Library/Application Support/jesseduffield/lazydocker/config.yml`
- `wtf/config.yml` → `~/.config/wtf/config.yml`

**Copied (not symlinked):**
- `preferences/*.plist` → `~/Library/Preferences/`

## 1Password Integration

Git GPG signing and wtfutil tokens use 1Password CLI (`op`). Credentials referenced via `op://` URIs in configs.
