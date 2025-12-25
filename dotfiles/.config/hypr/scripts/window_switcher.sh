#!/bin/bash

# Get a list of all open windows in Hyprland
# Format: "title | class | address"
WINDOW_LIST=$(hyprctl clients -j | jq -r '.[] | select(.workspace.name != "special") | [ .title, .class, .address ] | join(" | ")')

# Use Wofi to present the list of windows and get user selection
# The chosen window's information will be stored in the 'SELECTED_WINDOW' variable
SELECTED_WINDOW=$(echo "$WINDOW_LIST" | wofi --dmenu --prompt "Switch to Window:")

# Extract the window address from the selected window string
# The address is the last part of the string, separated by " | "
WINDOW_ADDRESS=$(echo "$SELECTED_WINDOW" | awk -F ' | ' '{print $NF}')

# If a window was selected and an address was found, focus on that window
if [[ -n "$WINDOW_ADDRESS" ]]; then
    hyprctl dispatch focuswindow address:"$WINDOW_ADDRESS"
fi