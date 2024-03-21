#!/bin/bash

set -e

source "../script/lib/utils.sh"

if ! [ -x "$(command -v code)" ]; then
  error 'VSCode is not installed.'
  exit 1
fi

# Install VSCode extensions
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install-extension formulahendry.auto-rename-tag
code --install-extension karunamurti.haml
code --install-extension Shopify.ruby-lsp
code --install-extension redhat.vscode-yaml
code --install-extension sleistner.vscode-fileutils
# code --install-extension jakebecker.elixir-ls
code --install-extension elixir-tools.elixir-tools
code --install-extension ziglang.vscode-zig
code --install-extension davidanson.vscode-markdownlint
code --install-extension florinpatrascu.vscode-elixir-snippets
code --install-extension ms-azuretools.vscode-docker
