#!/bin/sh
#
# Configure Spectacle.app keyboard shortcuts.
# https://github.com/eczarny/spectacle
#
# (source: https://github.com/pmeinhardt/dotfiles/blob/master/spectacle/install.sh)

if test -d ~/Library/Application\ Support/Spectacle
then
  sourcedir=$(dirname "$0")
  source=$(realpath "$sourcedir/shortcuts.json")
  cp "$source" ~/Library/Application\ Support/Spectacle/Shortcuts.json
fi
