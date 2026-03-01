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
| force-audio-input | locks preferred mic as input device |

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

## Audio Input Lock

macOS switches the input device whenever Bluetooth audio (e.g. AirPods) connects. A launchd agent polls every 5s and forces the preferred mic back.

**How it works:**
- `scripts/force-audio-input.sh` uses `SwitchAudioSource` (from `switchaudio-osx`) to check/set the input device
- `launchagents/com.jopcmelo.force-audio-input.plist` runs the script at login via launchd
- `setup.sh` copies the plist to `~/Library/LaunchAgents/` with the correct dotfiles path injected

**Changing the preferred mic:**
1. List available inputs: `SwitchAudioSource -t input -a`
2. Update `PREFERRED_INPUT` in `scripts/force-audio-input.sh`
3. Re-run `./setup.sh` to reload the agent

**Checking status:**
```bash
launchctl list | grep force-audio-input   # running?
SwitchAudioSource -t input -c             # current input?
cat /tmp/force-audio-input.err            # errors?
```

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
├── scripts/force-audio-input.sh
├── launchagents/com.jopcmelo.force-audio-input.plist
└── preferences/{BetterDisplay,MacMouseFix}.plist
```
