readonly REPO="https://github.com/asdf-vm/asdf.git"
readonly VERSION="v0.7.4"

. "$HOME/dotfiles/scripts/print.sh"

install_plugin() {
  local name="$1"
  local url="$2"
  if ! asdf plugin-list | grep -Fq "$name"; then
    asdf plugin-add "$name" "$url" | print_info
  fi
  success "Installed $name asdf plugin"
}

install_plugins() {
  info "Installing asdf plugins..."
  install_plugin "ruby" "https://github.com/asdf-vm/asdf-ruby.git"
  install_plugin "nodejs" "https://github.com/asdf-vm/asdf-nodejs.git"
  install_plugin "postgres" "https://github.com/smashedtoatoms/asdf-postgres"
  install_plugin "erlang" "https://github.com/asdf-vm/asdf-erlang.git"
  install_plugin "elixir" "https://github.com/asdf-vm/asdf-elixir.git"
}

plugin_setup() {
  # NOTE: necessary for nodejs plugin
  "$HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring" 2>&1 | print_info
}

update_plugins() {
  info "Updating asdf plugins..."
  asdf plugin-update --all | print_info
  success "Updated asdf plugins"
}

install_or_update_asdf() {
  local path="$HOME/.asdf"
  if [ ! -d "$path" ]; then
    info "Installing asdf"
    git clone "$REPO" "$path" --branch "$VERSION" \
      | print_info
    success "Installed asdf"
  else
    info "Updating asdf..."
    asdf update | print_info
    success "Updated asdf"
  fi
  source "$path/asdf.sh"
}

install_or_update_asdf \
  && install_plugins \
  && plugin_setup \
  && update_plugins
