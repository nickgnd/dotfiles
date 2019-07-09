#!/bin/sh
#
# asdf - Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more 
#
# This installs asdf (https://github.com/asdf-vm/asdf), then be sure to enable the `asdf` plugin on `oh-my-zsh`.
#

if [ ! -f $ASDF_DIR/asdf.sh ]; then
  echo 'installing asdf-vm...'
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.1
fi

# Source asdf before install the plugins
source $HOME/.asdf/asdf.sh


## Install plugins

# installed_plugins=$(asdf plugin-list)
asdf_detect_plugin() {
  asdf plugin-list | grep -q ${1}
  return $?
}

# Erlang
if asdf_detect_plugin 'erlang'; then
  echo 'asdf - erlang plugin already installed'
else
  echo 'asdf - installing the erlang plugin'
  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
fi


# Elixir
if asdf_detect_plugin 'elixir'; then
  echo 'asdf - elixir plugin already installed'
else
  echo 'asdf - installing the elixir plugin'
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
fi

# Node
if asdf_detect_plugin 'node'; then
  echo 'asdf - node plugin already installed'
else
  echo 'asdf - installing the node plugin'
  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
fi

# Ruby
if asdf_detect_plugin 'ruby'; then
  echo 'asdf - ruby plugin already installed'
else
  echo 'asdf - installing the ruby plugin'
  asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
fi

# Postgres
if asdf_detect_plugin 'postgres'; then
  echo 'asdf - postgres plugin already installed'
else
  echo 'asdf - installing the postgres plugin'
  asdf plugin-add postgres https://github.com/smashedtoatoms/asdf-postgres.git
fi
