#!/bin/bash
# macOS settings - based on current preferences
# Run: ./macos.sh
# Note: Some changes require logout/restart to take effect

echo "Configuring macOS settings..."

# Close System Preferences to prevent override
osascript -e 'tell application "System Preferences" to quit' 2>/dev/null

# =============================================================================
# Dock
# =============================================================================

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 43
defaults write com.apple.dock orientation -string "bottom"
defaults write com.apple.dock show-recents -bool false

# =============================================================================
# Finder
# =============================================================================

defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowPathbar -bool false
defaults write com.apple.finder ShowStatusBar -bool false

# Column view by default
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Folders first, sorted alphabetically
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXArrangeGroupViewBy -string "Name"

# Search current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Note: Adding ~/Developer to sidebar must be done manually via Finder drag-and-drop

# Desktop: snap to grid
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist 2>/dev/null || \
/usr/libexec/PlistBuddy -c "Add :DesktopViewSettings:IconViewSettings:arrangeBy string grid" ~/Library/Preferences/com.apple.finder.plist

# Show hard drives on desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true

# =============================================================================
# Keyboard
# =============================================================================

# Key repeat: lower = faster (normal is 6, min is 1)
defaults write NSGlobalDomain KeyRepeat -int 2
# Delay until repeat: lower = shorter (normal is 25)
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# =============================================================================
# Trackpad
# =============================================================================

# Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Tracking speed (0 to 3, default 1)
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 0.875

# Traditional scroll direction (not natural)
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# =============================================================================
# Screenshots
# =============================================================================

defaults write com.apple.screencapture location -string "~/Desktop"
defaults write com.apple.screencapture type -string "png"

# =============================================================================
# Menu Bar
# =============================================================================

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# 24-hour clock
defaults write com.apple.menuextra.clock Show24Hour -bool true

# =============================================================================
# Hot Corners (disabled)
# =============================================================================

# Top left
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom right
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-br-modifier -int 0

# =============================================================================
# Accessibility
# =============================================================================

# Reduce motion/animations
defaults write com.apple.universalaccess reduceMotion -bool true
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# =============================================================================
# Misc
# =============================================================================

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Don't create .DS_Store on network/USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# =============================================================================
# Display Scaling
# =============================================================================

# External 34" ultrawide
displayplacer "id:9B1AAFCC-12F0-4BCF-974A-5A8C5D7ACF0E res:3440x1440 hz:100 color_depth:8 enabled:true scaling:on origin:(0,0) degree:0" 2>/dev/null || true

# Built-in MacBook display (compact scaling)
displayplacer "id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:1800x1169 hz:120 color_depth:8 enabled:true scaling:on origin:(0,0) degree:0" 2>/dev/null || true

# =============================================================================
# Apply changes
# =============================================================================

killall Dock
killall Finder

echo "Done. Some changes may require logout/restart."
echo "Note: For display scaling, run 'displayplacer list' after setting preferred scale manually."
