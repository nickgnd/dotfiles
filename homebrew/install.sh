#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_DIR=$(dirname "$0")

# shellcheck source=../script/lib/utils.sh
source "$SCRIPT_DIR/../script/lib/utils.sh"

if ! command -v brew >/dev/null; then
  print_info "INSTALL HOMEBEW…"
  /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  print_info "UPDATE HOMEBEW…"
  brew update | print_progress
fi

print_info "INSTALL/UPDATE BREWS…"
brew bundle \
  --no-lock \
  --quiet \
  --no-upgrade \
  --file "$SCRIPT_DIR/Brewfile" \
  | print_progress
