#!/bin/bash

# variables

# can be global (used in 2 places: check if in right directory, symlink)
# DOTFILES_DIR="$HOME/dotfiles"

# check if folder exists
# if [[ -d "$DOTFILES_DIR" ]]; then
#   echo "Symlink dotfiles from $DOTFILES_DIR"
# else
#   echo "$DOTFILES_DIR does not exist"
#   exit 1
# fi
#
# # home
# read -p "Symlink files for ~/ ? (y/n) " RESP
# if [ "$RESP" = "y" ]; then
#   for f in home/*; do
#     FILE="${f##*/}"
#     echo "link $FILE to $HOME/.$FILE"
#     ln -s "$DOTFILES_DIR/$f" "$HOME/.$FILE"
#   done
# fi
#
# # atom
# read -p "Symlink files for atom?  (y/n) " RESP
# if [ "$RESP" = "y" ]; then
#   echo "link $DOTFILES_DIR/.atom to $HOME/"
#   ln -s "$DOTFILES_DIR/.atom" "$HOME"
# fi
#
# # agents
# read -p "Symlink launchd agents? (y/n)" RESP
# if [ "$RESP" = "y" ]; then
#   for f in agents/*.plist; do
#     echo "link $f to $HOME/Library/LaunchAgents/"
#     ln -s "$DOTFILES_DIR/$f" "$HOME/Library/LaunchAgents/"
#   done
# fi

# global variables
readonly DOTFILES_DIR="$HOME/dotfiles"

prompt_user() {
  local question=$1
  local response
  read -p "Symlink files for $question? (Y/n) " response
  [[ "$response" != "n" ]]
}

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

symlink_home() {
  local files=home/*
  local f
  local f_name
  for f in $files
  do
    f_name="${f##*/}"
    symlink_file "$DOTFILES_DIR/$f" "$HOME/.$f_name"
  done
}

main() {
  local dir=$HOME
  local f=$HOME/dotfiles/zshrc2

  prompt_user "~/" \
    && symlink_home

  # read -p "Symlink files for ~/ ? (y/n) " RESP
  # if [ "$RESP" = "y" ]; then
  #   for f in home/*; do
  #     FILE="${f##*/}"
  #     echo "link $FILE to $HOME/.$FILE"
  #     ln -s "$DOTFILES_DIR/$f" "$HOME/.$FILE"
  #   done
  # fi

  # prompt_user "~/" \
  #   && echo "yes"

  #symlink_file $f $HOME/dotfiles/$f

  # is_symlink $f \
  #   && echo "is symlink";

  # file_exists $f \
  #   && remove_file $f;
}
main
