#!/bin/bash

set -e

source "../scripts/utils.sh"

readonly TPM_DIR="$HOME/.tmux/plugins/tpm"

if [ -d "$TPM_DIR" ]; then
  print_info "UPDATE TMUX PLUGINS…"
  "$TPM_DIR"/bin/update_plugins all | print_progress
fi
