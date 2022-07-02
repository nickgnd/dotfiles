#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# To debug, uncomment:
# set -o xtrace

source "../script/lib/utils.sh"

# Symlink custom settings, tasks and keybindings
create_symlinks "$(pwd)" "$HOME/Library/Application Support/Code/User/"

# Symlink custom snippets
create_symlinks "$(pwd)/snippets" "$HOME/Library/Application Support/Code/User/snippets/"
