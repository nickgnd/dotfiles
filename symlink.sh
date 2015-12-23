#!/bin/bash

readonly DOTFILES_DIR="$HOME/dotfiles"

is_symlink() {
  local var=$1
  [[ -h $var ]]
}

file_exists() {
  local var=$1
  [[ -e $var ]]
}

remove_file() {
  local var=$1
  echo "Removing $var..."
  rm -rf $var
}

symlink_file() {
  local from=$1
  local to=$2
  echo "Symlink $from to $to..."

  is_symlink $to \
    && echo "$to is already symbolic link" \
    && remove_file $to

  file_exists $to \
    && echo "$to is a file, please check before rm" \
    && exit 1

  ln -s "$from" "$to" \
    && echo "Linked $from to $to...\n "
}

symlink_files() {
  local files=$1
  local destination=$2
  local f
  local f_name

  for f in $files
  do
    f_name="${f##*/}"
    symlink_file "$DOTFILES_DIR/$f" "$destination$f_name"
  done
}

prompt_user() {
  local question=$1
  local response
  read -p "Symlink files for $question? (Y/n) " response
  [[ "$response" != "n" ]]
}

# main
main() {
  local dir=$HOME
  local f=$HOME/dotfiles/zshrc2

  prompt_user "~/" \
    && symlink_files "home/*" "$HOME/."

  prompt_user "LaunchD Agents" \
    && symlink_files "agents/*.plist" "$HOME/Library/LaunchAgents/"

  prompt_user "Atom Editor" \
    && symlink_files ".atom" "$HOME/"
}
main
