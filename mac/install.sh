#!/bin/bash

set -e

print_info() {
  local msg=$1
  printf "\r  [\033[00;34mINFO\033[0m] %s\n" "$msg"
}

print_question() {
  local msg=$1
  printf "\r  [ \033[0;33m??\033[0m ] -> %s\n" "$msg"
}

set_name() {
  local old_name name force=$1
  old_name=$(scutil --get ComputerName)
  if [ "$force" == false ]; then
    print_question "HOW SHOULD THIS COMPUTER BE CALLED? (currently: $old_name)"
    printf -v prompt "\r  [ \033[0;33m!!\033[0m ] -> "
    read -r -e -p "$prompt" name </dev/tty
  else
    name=$old_name
  fi
  print_info "SETTING COMPUTER NAME to '$name'…"
  sudo scutil --set ComputerName "$name"
  sudo scutil --set LocalHostName "$name"
}

declare force=false
while getopts "f" option; do
  case $option in
    f)  force=true;;
    \?) force=false;;
  esac
done

print_info "SETTING MACOS DEFAULTS…"
./defaults.sh

print_info "SETTING COMPUTER NAME…"
set_name "$force"
