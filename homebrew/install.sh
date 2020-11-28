#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_DIR=$(dirname "$0")

# shellcheck source=../scripts/utils.sh
source "$SCRIPT_DIR/../scripts/utils.sh"

readonly HOMEBREW_URL="https://raw.githubusercontent.com/Homebrew/install/master/install"

if ! command -v brew >/dev/null; then
  print_info "INSTALL HOMEBEW…"
  curl -fsSL "$HOMEBREW_URL" | ruby 2>&1 | print_progress
else
  print_info "UPDATE HOMEBEW…"
  brew update | print_progress
fi

print_info "INSTALL/UPDATE BREWS…"
brew bundle --no-lock --quiet --file "$SCRIPT_DIR/Brewfile" | print_progress
