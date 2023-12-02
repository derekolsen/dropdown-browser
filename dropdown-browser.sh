#!/bin/bash

# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# <@derekolsen(GitHub)> wrote this file.  As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.   Derek Olsen
# ----------------------------------------------------------------------------

# Requires firefox, xdotool, xwininfo

FIREFOX_PROFILE="Dropdown"
CLASS_GUID=8e0420f1-8de5-48e2-a277-395e4f4f6300
URL="https://chat.openai.com"

cleanup() {
    echo "Caught SIGINT, terminating processes..."
    kill "$PID"
}
trap cleanup INT


X_ID=$(xdotool search --class $CLASS_GUID | tail -n 1)

if [[ -n $X_ID ]]; then
    state=$(xwininfo -id $X_ID | grep "Map State:" | awk '{print $3}')
    case "$state" in
        "IsViewable")
            xdotool windowminimize $X_ID
            ;;
        "IsUnMapped")
            xdotool windowactivate $X_ID
            ;;
        *)
            notify-send "Dropdown browser cannot determine window state"
            ;;
    esac
else
    firefox -P $FIREFOX_PROFILE $URL --class $CLASS_GUID &
fi

