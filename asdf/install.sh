#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# To debug, uncomment:
# set -o xtrace

source "../script/lib//utils.sh"

declare ASDF_BIN="$HOME/.asdf"
readonly VERSION="v0.8.0"

function add_plugin() {
  local name="$1"
  if ! asdf plugin-list | grep -Fq "$name"; then
    asdf plugin-add "$name"
  fi
}

if [ ! -d "$ASDF_BIN" ]; then
  info "INSTALL ASDF…"
  git clone \
    "https://github.com/asdf-vm/asdf.git" \
    "$ASDF_BIN" \
    --branch "$VERSION"
else
  info "UPDATE ASDF…"
  asdf update
fi

# shellcheck source=../../.asdf/asdf.sh
source "$ASDF_BIN/asdf.sh"

add_plugin "ruby"
add_plugin "nodejs"
add_plugin "postgres"
add_plugin "erlang"
add_plugin "elixir"

info "UPDATE ASDF PLUGINS…"
asdf plugin-update --all
