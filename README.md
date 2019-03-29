# ~/dotfiles

How I set up my dev environment.

![screenshot](./screenshot.png)

## Directory

```
.
├── agents (launchd scripts)
│
├── atom (atom files)
│
├── config (app specific configs)
│
├── home (symlinked to ~/)
│   ├── gemrc            (global config for ruby gems)
│   ├── gitconfig        (global git config)
│   ├── gitignore_global (global gitignore)
│   ├── hushlogin        (omit "last login" message)
│   ├── tmux.conf        (config for tmux)
│   ├── tool-versions    (asdf default versions)
│   └── zshrc            (zsh/oh-my-zsh config)
│
├── iterm2 (profile and settings for iterm)
│
├── bin (executable scripts for backups, etc.)
│
├── ssh (config for macOS ssh agent)
│
└── zsh (custom dir for oh-my-zsh, plugins, etc.)
```


## Getting started

### Install Dependencies

#### 1. Terminal

* [iTerm2](https://www.iterm2.com/)

#### 2. Homebrew

* [Homebrew](http://brew.sh/)

#### 3. Install Dotfiles and Packages

Clone repo and symlink files *(old links are replaced by new ones)*:

```sh
# clone repo
git clone --recursive git@github.com:klappradla/dotfiles.git
cd dotfiles

# install Homebrew packages
brew bundle

# install fzf shell extensions
/usr/local/opt/fzf/install

# install dotfiles
bin/install
```

#### 4. Editors *(optional)*

* [Atom](https://atom.io/)
* Neovim: install [vim-plug](https://github.com/junegunn/vim-plug) for plugin management

### Setup iTerm2

Point **`Load preferences from custom folder or URL`** to `~/dotfiles/iterm2`

If the settings are not applied, run:

	defaults read com.googlecode.iterm2

### Setup Atom

Run `Package List: Install` from the command palette to install all packages from `/atom/packages.txt`

### Setup backups

Copy the example backup config and adapt it for the current machine:
```sh
cp bin/backup.conf.example bin/backup.conf
```

## Usage

### SSH

Add ssh keys to macOS' ssh-agent, e.g.:

    ssh-add -K ~/.ssh/id_rsa

The ssh-agent will no automatically load the key from the keychain every time it needs it.

## Hints to setup system from scratch

### macOS

show hidden files in finder

	defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder

show file endings

	defaults write NSGlobalDomain AppleShowAllExtensions -bool true

install xcode command line tools

	xcode-select --install

use homebrew's zsh

```sh
sudo vim /etc/shells

# add /usr/local/bin/zsh

chsh -s /usr/local/bin/zsh
```

allow rbenv's ruby on the macOS firewall *(same for rspec and other ruby executables)*

    sudo /usr/libexec/ApplicationFirewall/socketfilterfw --add /Users/max/.rbenv/shims/ruby

    sudo /usr/libexec/ApplicationFirewall/socketfilterfw --add /Users/max/.asdf/shims/ruby


### SSH

Generate ssh key

	ssh-keygen -t rsa

copy public key to clipboard

	pbcopy < ~/.ssh/id_rsa.pub

### Neovim

Install python (2 and 3) for neovim

```shell
pip2 install --user neovim
pip3 install --user neovim
```
