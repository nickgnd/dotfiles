#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# To debug, uncomment:
# set -o xtrace

source "../script/lib/utils.sh"

# Setup FZF key bindings and fuzzy completion (https://github.com/junegunn/fzf#using-homebrew)
info "INSTALL FZF KEY BINDINGS AND COMPLETION…"
$(brew --prefix)/opt/fzf/install --no-update-rc
