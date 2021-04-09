#!/bin/bash

set -e

# TODO: for now disabling this in favor of other backups
# source "../script/lib/utils.sh"

# readonly TOPIC_DIR=$(pwd)
# NOTE: necessary for having absolute paths
# readonly SYMLINKS=$(find "$TOPIC_DIR" -maxdepth 1 -name "*.symlink")

# for src in $SYMLINKS; do
#   name=$(basename "$src" .symlink)
#   dest="$HOME/Library/LaunchAgents//$name"
#   symlink "$src" "$dest"
# done
