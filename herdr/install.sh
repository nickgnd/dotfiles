#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# To debug, uncomment:
# set -o xtrace

source "../script/lib/utils.sh"

# Install/update the herdr agent integrations we use. Each writes a
# herdr-managed hook/plugin into the agent's own config dir (outside this repo,
# e.g. ~/.claude/hooks, ~/.config/opencode/plugins) so herdr can report
# semantic agent state to the sidebar. Safe to re-run — herdr owns and
# overwrites its own files, which is why they aren't tracked here.
if command -v herdr >/dev/null 2>&1; then
  for agent in claude opencode; do
    info "Installing herdr $agent integration…"
    herdr integration install "$agent"
  done
else
  warn "herdr not found on PATH; skipping agent integration install"
fi
