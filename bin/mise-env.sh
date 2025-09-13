#!/usr/bin/env bash

# Use this file to set environment variables for your shell session
# with mise, scoped to the current folder.
#
# Usage:
#
# ```
# # .mise.toml
#
# [env]
# _.source = "./bin/mise-env.sh"
# ```

# Set TMUX_SESSION_NAME if running inside tmux
if [ -n "$TMUX" ]; then
    export TMUX_SESSION_NAME=$(tmux display-message -p '#S')
else
    export TMUX_SESSION_NAME=""
fi
