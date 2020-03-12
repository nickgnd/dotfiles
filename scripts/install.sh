#!/bin/bash

set -e

readonly TOPICS=(homebrew zsh mac asdf)
readonly TOPICS_DIR="$(dirname "$0")/../topics"
# readonly TOPICS_DIR="$HOME/dotfiles/topics"

for topic in "${TOPICS[@]}"; do
  cd "$TOPICS_DIR/$topic"

  find . -maxdepth 1 -name install.sh \
    | while read -r installer; do $installer; done
    # | while read -r installer; do $installer -y; done
done
