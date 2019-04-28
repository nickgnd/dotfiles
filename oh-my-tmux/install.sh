#!/bin/sh
#
# Oh-my-tmux
#
# This installs oh-my-tmux (https://github.com/gpakosz/.tmux).
#
TMUX_FOLDER=~/.tmux

if [ ! -d $TMUX_FOLDER ]; then
  echo 'Installing oh-my-tmux'
  git clone https://github.com/gpakosz/.tmux.git $TMUX_FOLDER
  ln -s -f $TMUX_FOLDER/.tmux.conf ~/.tmux.conf
  cp -n $TMUX_FOLDER/.tmux.conf.local ~/.tmux.conf.local
fi
