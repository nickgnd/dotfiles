#!/bin/bash
# URL Example: nvim:///Users/nicolognudi/dotfiles/README.md?param=value

LOG_FILE="/tmp/script_args.log"

# Get the current date and time
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Write a header with timestamp
echo "[$TIMESTAMP] Script executed with arguments:" >> "$LOG_FILE"

# Loop through all arguments and write them to the log file
ARG_NUM=1
for arg in "$@"; do
    echo "  Arg $ARG_NUM: $arg" >> "$LOG_FILE"
    ((ARG_NUM++))
done

# Extract path from first argument
PATH_ARG="$1"

# Check if an argument was provided
if [ -n "$PATH_ARG" ]; then
    # Log the exact command we're trying to execute
    COMMAND="/opt/homebrew/bin/alacritty -e nvim \"$PATH_ARG\""
    echo "UEEE! Attempting to execute: $COMMAND" >> "$LOG_FILE"

    # Try executing with full paths and without background
    /opt/homebrew/bin/alacritty -e /opt/homebrew/bin/nvim "$PATH_ARG"

    # Log execution result
    if [ $? -eq 0 ]; then
        echo "Command executed successfully" >> "$LOG_FILE"
    else
        echo "Command failed with exit code $?" >> "$LOG_FILE"
    fi
else
    echo "No path provided to open" >> "$LOG_FILE"
fi

## WORKING version
# on open location schemeUrl
# 	-- display alert schemeUrl
#
# 	-- URL Example: nvim:///Users/nicolognudi/dotfiles/README.md
# 	-- Parse the URL to get both path and parameter
# 	set oldDelims to AppleScript's text item delimiters
#
# 	-- First extract everything after nvim://
# 	set AppleScript's text item delimiters to {"nvim://"}
# 	set fullPath to item 2 of the text items of schemeUrl
#
# 	-- Restore original delimiters
# 	set AppleScript's text item delimiters to oldDelims
#
# 	-- Pass both path and parameter to the bash script
# 	do shell script "/bin/bash " & quoted form of "/Users/nicolognudi/dotfiles/neovim_url_handler/nvim_url_handler.sh" & " " & quoted form of fullPath
#
# 	-- display alert "Path: " & fullPath
# end open location
