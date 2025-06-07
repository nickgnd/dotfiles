#!/bin/bash
# URL Example: nvim://file//Users/nicolognudi/dotfiles/README.md:10?tmux-session=dotfiles
#
# Relevant sources:
# - https://github.com/chrisliuqq/mac-custom-url-scheme-to-script

DEBUG=false
LOG_FILE="/tmp/script_args.log"

# Get the current date and time
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

log() {
    if [ "$DEBUG" = true ]; then
        echo "$1" >> "$LOG_FILE"
    fi
}

# Write a header with timestamp
log "[$TIMESTAMP] Script executed with arguments:"

# Loop through all arguments and write them to the log file
ARG_NUM=1
for arg in "$@"; do
    log "  Arg $ARG_NUM: $arg"
    ((ARG_NUM++))
done

# Extract socket and path from arguments
TMUX_SESSION_NAME="$1"
FILE_PATH="$2"

# Check if both arguments were provided
if [ -n "$TMUX_SESSION_NAME" ] && [ -n "$FILE_PATH" ]; then
    # Build the socket path (see /bin/nvim_listen script)
    SOCKET_PATH="/tmp/nvim-$TMUX_SESSION_NAME"

    # Log the exact command we're trying to execute
    COMMAND="/opt/homebrew/bin/nvim --server \"$SOCKET_PATH\" --remote \"$FILE_PATH\""
    log "Attempting to execute: $COMMAND"

    # Check if the socket exists
    if [ -e "$SOCKET_PATH" ]; then
        # Try connecting to existing nvim instance
        /opt/homebrew/bin/nvim --server "$SOCKET_PATH" --remote "$FILE_PATH"

        # Log execution result
        if [ $? -eq 0 ]; then
            log "File opened in existing Neovim instance on socket $SOCKET_NAME"
        else
            log "Failed to open file in existing Neovim instance, exit code $?"

            # Fall back to opening in a new instance if remote connection fails
            log "Falling back to new Alacritty window"
            /opt/homebrew/bin/alacritty -e /opt/homebrew/bin/nvim "$FILE_PATH"
        fi
    else
        # Socket doesn't exist, log this and fall back to opening in a new window
        log "Socket $SOCKET_PATH doesn't exist, opening in new Alacritty window"
        /opt/homebrew/bin/alacritty -e /opt/homebrew/bin/nvim "$FILE_PATH"
    fi
elif [ -n "$FILE_PATH" ]; then
    # Only file path provided (no socket), open in new Alacritty window
    log "No socket provided, opening in new Alacritty window"
    /opt/homebrew/bin/alacritty -e /opt/homebrew/bin/nvim "$FILE_PATH"
else
    log "No path provided to open"
fi

# AppleScript to register the URL schema
# (create a new script with the Script Editor application)
#
#
# on open location schemeUrl
# 	-- Save original delimiters
# 	set oldDelims to AppleScript's text item delimiters
#
# 	try
# 		-- Extract everything after nvim://
# 		set AppleScript's text item delimiters to {"nvim://"}
# 		if (count of text items of schemeUrl) < 2 then error "Invalid URL format"
# 		set fullContent to item 2 of the text items of schemeUrl
#
# 		-- Extract the file path (everything between file:/ and ?)
# 		set AppleScript's text item delimiters to {"file/"}
# 		if (count of text items of fullContent) < 2 then error "Invalid URL format, missing file path"
# 		set pathWithQuery to item 2 of the text items of fullContent
#
# 		-- Split path and query
# 		set AppleScript's text item delimiters to {"?"}
# 		set filePath to item 1 of the text items of pathWithQuery
#
# 		-- Extract tmux session from query if present
# 		set tmuxSession to ""
# 		if (count of text items of pathWithQuery) > 1 then
# 			set queryPart to item 2 of the text items of pathWithQuery
#
# 			-- Look for tmux-session parameter
# 			set AppleScript's text item delimiters to {"tmux-session="}
# 			if (count of text items of queryPart) > 1 then
# 				set tmuxSession to item 2 of the text items of queryPart
#
# 				-- Handle additional query parameters (if any)
# 				set AppleScript's text item delimiters to {"&"}
# 				set tmuxSession to item 1 of the text items of tmuxSession
# 			end if
# 		end if
#
# 		-- Pass tmux session name and file path to the bash script
# 		do shell script "/bin/bash " & quoted form of "/Users/nicolognudi/dotfiles/neovim_url_handler/nvim_url_handler.sh" & " " & quoted form of tmuxSession & " " & quoted form of filePath
#
# 	on error errMsg
# 		display alert "Error processing URL: " & errMsg
# 	end try
#
# 	-- Restore original delimiters
# 	set AppleScript's text item delimiters to oldDelims
# end open location
