#!/bin/sh
#
# Oh-my-zsh
#
# This installs oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh).

export ZSH=~/.oh-my-zsh

if [ ! -d $ZSH ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi