#!/bin/bash

# TODO: check versions and fail if too old
# use asdf from homebrew again…
set -e

source "../scripts/utils.sh"

declare ASDF_BIN="$HOME/.asdf"
readonly REPO="https://github.com/asdf-vm/asdf.git"
readonly VERSION="v0.7.5"

install_plugin() {
  local name="$1"
  local url="$2"
  if ! asdf plugin-list | grep -Fq "$name"; then
    print_info "INSTALL ASDF $name PLUGIN…"
    asdf plugin-add "$name" "$url" | print_progress
  fi
}

install_plugins() {
  install_plugin "ruby" "https://github.com/asdf-vm/asdf-ruby.git"
  install_plugin "nodejs" "https://github.com/asdf-vm/asdf-nodejs.git"
  install_plugin "postgres" "https://github.com/smashedtoatoms/asdf-postgres"
  install_plugin "erlang" "https://github.com/asdf-vm/asdf-erlang.git"
  install_plugin "elixir" "https://github.com/asdf-vm/asdf-elixir.git"
}

update_plugins() {
  print_info "UPDATE ASDF PLUGINS…"
  asdf plugin-update --all | print_progress
}

if [ ! -d "$ASDF_BIN" ]; then
  git clone "$REPO" "$ASDF_BIN" --branch "$VERSION" | print_progress
else
  print_info "UPDATE ASDF…"
  asdf update | print_progress
fi

# needs to be available for adding plugins
source "$ASDF_BIN/asdf.sh"
install_plugins
# import keyring for nodejs plugin
"$HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring" 2>&1 | print_progress
update_plugins
