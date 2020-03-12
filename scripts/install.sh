#!/bin/bash

set -e

# readonly TOPICS=(homebrew zsh mac asdf neovim karabiner spectacle iterm editorconfig)
readonly TOPICS=(editorconfig)
readonly TOPICS_DIR="$(dirname "$0")/../topics"

install_topics() {
  export local OVERWRITE_SYMLINKS=false
  export local BACKUP_SYMLINKS=false
  export local SKIP_SYMLINKS=false

  for topic in "${TOPICS[@]}"; do
    cd "$TOPICS_DIR/$topic"

    find . -maxdepth 1 -name install.sh \
      | while read -r installer; do $installer; done
      # | while read -r installer; do $installer -y; done
    find . -maxdepth 1 -name symlink.sh \
      | while read -r symlink; do $symlink; done
  done
}

install_topics
