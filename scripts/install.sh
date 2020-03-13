#!/bin/bash

set -e

readonly DOTS_DIR="$(dirname "$(dirname "$0")")"
readonly DIR_PATTERN=(! -name ".git" -and ! -name "homebrew" -and ! -name "scripts")
readonly TOPICS=$(find "$DOTS_DIR" -maxdepth 1 -type d "${DIR_PATTERN[@]}")

install_topic() {
  local topic=$1
  cd "$topic"
  find . -maxdepth 1 -name install.sh \
    | while read -r installer; do $installer; done
  find . -maxdepth 1 -name symlink.sh \
    | while read -r symlink; do $symlink; done
}

install_topics() {
  export local OVERWRITE_SYMLINKS=false
  export local BACKUP_SYMLINKS=false
  export local SKIP_SYMLINKS=false

  install_topic "$DOTS_DIR/homebrew"

  for topic in ${TOPICS[*]}; do
    install_topic "$topic"
  done
}

install_topics
