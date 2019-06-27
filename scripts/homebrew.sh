. "$HOME/dotfiles/scripts/print.sh"

install_homebrew() {
  if ! command -v brew >/dev/null; then
    curl -fsSL $HOMEBREW_URL \
      | ruby 2>&1 \
      | print_info
  fi
  success "Homebrew installed"
}

install_apps() {
  brew bundle | print_info
  success "Apps installed"
}

install_fzf() {
  if ! command -v fzf >/dev/null; then
    fail "FZZ not installed"
  fi
  "$(brew --prefix)/opt/fzf/install" | print_info
}

install_homebrew \
  && install_apps \
  && install_fzf
