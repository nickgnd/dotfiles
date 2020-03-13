#!/bin/bash

set -e

source "../scripts/utils.sh"

readonly VIM_PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
readonly VIM_PLUG_PATH="$HOME/.local/share/nvim/site/autoload/plug.vim"

if [ ! -f "$VIM_PLUG_PATH" ]; then
  print_info "INSTALL VIM PLUG…"
  curl -fLo "$VIM_PLUG_PATH" --create-dirs "$VIM_PLUG_URL" | print_progress
fi

print_info "INSTALL NEOVIM PYTHON SUPPORT…"
pip3 install --user neovim | print_progress
