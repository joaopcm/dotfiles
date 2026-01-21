#!/bin/bash

CURSOR_APP_ID="com.todesktop.230313mzl4w4u92"

# Move to workspace 2
aerospace move-node-to-workspace 2

sleep 0.2

# Get current window ID
CURRENT_ID=$(aerospace list-windows --focused --format '%{window-id}')

# Find another Cursor window in workspace 2 (not the current one)
OTHER_CURSOR=$(aerospace list-windows --workspace 2 --format '%{window-id} %{app-bundle-id}' \
    | grep "$CURSOR_APP_ID" \
    | grep -v "^$CURRENT_ID " \
    | head -1 \
    | awk '{print $1}')

if [ -n "$OTHER_CURSOR" ]; then
    # Join with existing Cursor window and set accordion
    # Move current window toward the other Cursor window, then join
    aerospace join-with left 2>/dev/null || aerospace join-with right 2>/dev/null || aerospace join-with up 2>/dev/null || aerospace join-with down 2>/dev/null
    aerospace layout accordion
fi
