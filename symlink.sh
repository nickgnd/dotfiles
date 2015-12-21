#!/bin/bash

# variables

# can be global (used in 2 places: check if in right directory, symlink)
DOTFILES_DIR="$HOME/dotfiles"

# check if folder exists
if [[ -d "$DOTFILES_DIR" ]]; then
  echo "Symlink dotfiles from $DOTFILES_DIR"
else
  echo "$DOTFILES_DIR does not exist"
  exit 1
fi

# home
read -p "Symlink files for ~/ ? (y/n) " RESP
if [ "$RESP" = "y" ]; then
  for f in home/*; do
    FILE="${f##*/}"
    echo "link $FILE to $HOME/.$FILE"
    ln -s "$DOTFILES_DIR/$f" "$HOME/.$FILE"
  done
fi

# atom
read -p "Symlink files for atom?  (y/n) " RESP
if [ "$RESP" = "y" ]; then
  echo "link $DOTFILES_DIR/.atom to $HOME/"
  ln -s "$DOTFILES_DIR/.atom" "$HOME"
fi

# agents
read -p "Symlink launchd agents? (y/n)" RESP
if [ "$RESP" = "y" ]; then
  for f in agents/*.plist; do
    echo "link $f to $HOME/Library/LaunchAgents/"
    ln -s "$DOTFILES_DIR/$f" "$HOME/Library/LaunchAgents/"
  done
fi
