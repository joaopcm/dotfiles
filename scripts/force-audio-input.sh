#!/bin/bash

SWITCH=/opt/homebrew/bin/SwitchAudioSource
PREFERRED_INPUT="fifine  Microphone"

while true; do
    current=$($SWITCH -t input -c)
    if [[ "$current" != "$PREFERRED_INPUT" ]]; then
        $SWITCH -t input -s "$PREFERRED_INPUT"
    fi
    sleep 5
done
