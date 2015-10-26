#!/bin/bash

# variables
DOTFILES_DIR="$HOME/dotfiles"

# symlink function
link() {
  FROM="$1"
  TO="$2"
  echo "Link '$FROM' to '$TO'"
  if [ -e "$TO" ]
  then
    unlink "$TO"
    rm -R -f "$to"
  fi
  ln -s "$FROM" "$TO"
}

# check if folder exists
if [[ -d "$DOTFILES_DIR" ]]; then
  echo "Symlink dotfiles from $DOTFILES_DIR"
else
  echo "$DOTFILES_DIR does not exist"
  exit 1
fi

# home dir
read -p "Symlink files for ~/ ? (y/n) " RESP
if [ "$RESP" = "y" ]; then
  for LOCATION in $(find home -name '.*'); do
    FILE="${LOCATION##*/}"
    if [[ "$FILE" != ".DS_Store" ]]; then
      link "$DOTFILES_DIR/$LOCATION" "$HOME/$FILE"
    fi
  done
fi

# vim
read -p "Symlink files for vim?  (y/n) " RESP
if [ "$RESP" = "y" ]; then
   link "$DOTFILES_DIR/.vim" "$HOME"
fi

# atom
read -p "Symlink files for atom?  (y/n) " RESP
if [ "$RESP" = "y" ]; then
   link "$DOTFILES_DIR/.atom" "$HOME"
fi

# sublime
read -p "Symlink files for Sublime Text? (y/n) " RESP
if [ "$RESP" = "y" ]; then
  if [[ `uname` == 'Darwin' ]]; then
    echo "Symlink sublime text 3 settings"

    SUBLIME_DIR="$HOME/Library/Application Support/Sublime Text 3/Packages"

    if [[ -d "$SUBLIME_DIR" ]]; then

      # set internal field seperator differnt to whitespace (for filenames with whitespace char)
      ORIGIFS=${IFS}
      IFS=$'\n'
      for LOCATION in $(find sublime/Packages/User -name '*.sublime-settings'); do
        IFS=${ORIGIFS}
        FILE="${LOCATION##*/}"
        link "$DOTFILES_DIR/$LOCATION" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/$FILE"
      done
      # reset internal field seperator
      IFS=${ORIGIFS}

      # themes
      for LOCATION in $(find sublime/Packages/User -name '*.tmTheme'); do
        FILE="${LOCATION##*/}"
        link "$DOTFILES_DIR/$LOCATION" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/$FILE"
      done
    else
      echo "Install Sublime Text http://www.sublimetext.com and rerun symlink-dotfiles.sh"
    fi
  fi
fi
