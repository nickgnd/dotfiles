#!/bin/sh
#
# vscode extensions (the app is installed via brew)
#

if ! [ -x "$(command -v code)" ]; then
  echo 'Error: code is not installed.' >&2
  exit 1
fi

# TODO: save custom settings
# Symlink vscode dotfiles
# ln -s ~/.dotfiles/settings.json ~/Library/Application\ Support/Code/User/settings.json
# ln -s ~/.dotfiles/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
# ln -s ~/.dotfiles/snippets/ ~/Library/Application\ Support/Code/User/snippets

# Install vscode extensions
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install-extension formulahendry.auto-rename-tag
code --install-extension misogi.ruby-rubocop
code --install-extension mjmcloug.vscode-elixir
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension rebornix.Ruby
code --install-extension redhat.vscode-yaml
code --install-extension wayou.vscode-todo-highlight
