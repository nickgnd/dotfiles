#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# To debug, uncomment:
# set -o xtrace

source "../script/lib/utils.sh"

readonly MISE_DIR="$HOME/.config/mise"

if [ -d "$MISE_DIR" ]; then
  # https://usage.jdx.dev/cli/
  info "Installing mise usage plugin needed for CLI autocompletion"
  mise use -g usage

  # Set autocompletion (https://mise.jdx.dev/cli/#mise-completion-shell)
  info "Add Mise autocompletion for fish..."
  mise completion fish > ~/.config/fish/completions/mise.fish
fi
