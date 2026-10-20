#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# To debug, uncomment:
# set -o xtrace

source "../script/lib/utils.sh"

# Keep bin/herdr-space-status running (sidebar $ticket and $phoenix values).
# Copied rather than symlinked: launchd can refuse symlinked plists at login.
readonly LABEL="dev.herdr.space-status"
readonly PLIST="$HOME/Library/LaunchAgents/$LABEL.plist"

info "Loading herdr space-status launchd agent…"
cp space-status.plist "$PLIST"
launchctl bootout "gui/$(id -u)/$LABEL" 2>/dev/null || true
launchctl bootstrap "gui/$(id -u)" "$PLIST"
