#!/bin/bash

set -e

readonly DOTS_DIR="$(dirname "$(dirname "$0")")"
readonly DIR_PATTERN=(! -name ".git" -and ! -name "homebrew" -and ! -name "scripts")
readonly TOPICS=$(find "$DOTS_DIR" -maxdepth 1 -type d "${DIR_PATTERN[@]}")

install_topic() {
  local topic=$1 flags=$2
  cd "$topic"
  find . -maxdepth 1 -name install.sh \
    | while read -r installer; do $installer "$flags"; done
  find . -maxdepth 1 -name symlink.sh \
    | while read -r symlink; do $symlink; done
}

install_topics() {
  local flags=$1
  export local OVERWRITE_SYMLINKS=false
  export local BACKUP_SYMLINKS=false
  export local SKIP_SYMLINKS=false

  install_topic "$DOTS_DIR/homebrew" "$flags"

  for topic in ${TOPICS[*]}; do
    install_topic "$topic" "$flags"
  done
}

declare flags=""
while getopts "f" option; do
  case $option in
    f)  flags=-f;;
    \?) flags="";;
  esac
done

install_topics $flags
