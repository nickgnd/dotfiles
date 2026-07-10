#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# To debug, uncomment:
# set -o xtrace

source "../script/lib/utils.sh"

# Pi coding agent — https://pi.dev / https://github.com/earendil-works/pi
# Installed globally via npm (Pi ships no Homebrew formula). Uses whichever
# node/npm is active (mise); if the CLI ever disappears after a node switch,
# set `npmCommand` in ~/.pi/agent/settings.json to pin a stable node.
if ! command -v npm >/dev/null 2>&1; then
  error 'npm not found — install node via the mise topic first'
  exit 1
fi

if ! command -v pi >/dev/null 2>&1; then
  info "Installing pi coding agent…"
  npm install -g --ignore-scripts @earendil-works/pi-coding-agent
else
  success "pi already installed"
fi

if command -v pi >/dev/null 2>&1; then
  info "Installing pi-mcp-adapter…"
  pi install npm:pi-mcp-adapter
else
  warn "pi not on PATH after install; skipping pi-mcp-adapter"
fi
