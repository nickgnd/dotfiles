#!/bin/bash

readonly DOTFILES_DIR="$HOME/dotfiles"
readonly REPO="https://github.com/klappradla/dotfiles.git"

change_to_dir() {
  local dir=$1
  echo "Cd into $dir"
  cd $dir
}

clone_repo() {
  local url=$1
  echo "Clone $url..."
  git clone --recursive $url
}

# main
main() {
  change_to_dir $HOME \
    && clone_repo $REPO \
      && change_to_dir $DOTFILES_DIR \
        && sh symlink.sh
}
