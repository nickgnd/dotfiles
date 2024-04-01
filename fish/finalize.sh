#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# To debug, uncomment:
# set -o xtrace

source "../script/lib/utils.sh"

# NOTE: skipping FZF standard key-bindings in favour of `PatrickF1/fzf.fish` key-bindings
# (https://github.com/PatrickF1/fzf.fish/wiki/Uninstalling-other-fzf-plugins)
#
# Setup FZF key bindings and fuzzy completion (https://github.com/junegunn/fzf?tab=readme-ov-file#setting-up-shell-integration)
# info "INSTALL FZF KEY BINDINGS AND COMPLETION… "
# fzf --fish | source
