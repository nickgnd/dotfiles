#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# To debug, uncomment:
# set -o xtrace

source "../script/lib/utils.sh"

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


if [ "$SHELL" == "fish" ]; then
  /usr/bin/env fish -c "source \"$ASDF_BIN/asdf.fish\""

  # Add auto-completation
  # https://asdf-vm.com/guide/getting-started.html
  mkdir -p ~/.config/fish/completions
  ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
else
  # For zsh
  source "$ASDF_BIN/asdf.sh"
fi

add_plugin "ruby"
add_plugin "nodejs"
add_plugin "postgres"
add_plugin "erlang"
add_plugin "elixir"
add_plugin "python"
add_plugin "zig"

info "UPDATE ASDF PLUGINS…"
asdf plugin-update --all
