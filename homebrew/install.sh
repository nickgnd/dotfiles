#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_DIR=$(dirname "$0")

# shellcheck source=../script/lib/utils.sh
source "$SCRIPT_DIR/../script/lib/utils.sh"

if ! command -v brew >/dev/null; then
  info "INSTALL HOMEBEW…"
  /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  info "UPDATE HOMEBEW…"
  brew update
fi

info "INSTALL/UPDATE BREWS…"
brew bundle \
  --no-lock \
  --quiet \
  --no-upgrade \
  --file "$SCRIPT_DIR/Brewfile"
