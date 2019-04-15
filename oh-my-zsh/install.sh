#!/bin/sh
#
# Oh-my-zsh
#
# This installs oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh).
#
export ZSH=~/.oh-my-zsh

if [ ! -d $ZSH ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# This installs zsh syntax highlighting
#
ZSH_SYNTAX_HIGHLIGHTING_FOLDER=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
if [ -d $ZSH ] && [ ! -d "$ZSH_SYNTAX_HIGHLIGHTING_FOLDER" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_SYNTAX_HIGHLIGHTING_FOLDER
fi
