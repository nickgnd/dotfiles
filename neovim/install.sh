#!/bin/bash

set -e

readonly VIM_PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
readonly VIM_PLUG_PATH="$HOME/.local/share/nvim/site/autoload/plug.vim"

print_info() {
  local msg=$1
  printf "\r  [\033[00;34mINFO\033[0m] %s\n" "${msg}"
}

print_progress() {
  local data
  while read -r data; do
    printf "\r  [ \033[00;34m..\033[0m ] %s\n" "${data}"
  done
}

if [ ! -f "$VIM_PLUG_PATH" ]; then
  print_info "INSTALL VIM PLUG…"
  curl -fLo "$VIM_PLUG_PATH" --create-dirs "$VIM_PLUG_URL" | print_progress
fi

print_info "INSTALL NEOVIM PYTHON SUPPORT…"
pip3 install --user neovim | print_progress
