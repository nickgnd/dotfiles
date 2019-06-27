readonly VIM_PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

. "$HOME/dotfiles/scripts/print.sh"

install_vim_plug() {
  local path="$HOME/.local/share/nvim/site/autoload/plug.vim"
  if [ ! -f "$path" ]; then
    curl -fLo "$path" --create-dirs "$VIM_PLUG_URL" \
      | print_info
  fi
  success "Vim Plug installed"
}

install_python_support() {
  pip2 install --user neovim | print_info
  pip3 install --user neovim | print_info
}

install_vim_plug \
  && install_python_support
