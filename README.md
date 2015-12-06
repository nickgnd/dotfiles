# ~/dotfiles

Config and utility files to set up my working environment (on OSX). Inspired by [paulmillr's](https://github.com/paulmillr/dotfiles) and [ryanb's](https://github.com/ryanb/dotfiles) dotfiles. Thanks!

I use [iTerm2](http://iterm2.com/) as terminal, the great [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) framework to manage my zsh settings and [vim-plug](https://github.com/junegunn/vim-plug) to manage my vim plugins. For colors, I recently switched to Ethan Schoonover's awesome [solarized](http://ethanschoonover.com/solarized) scheme and use it in iTerm, Vim and Atom.


## Directory

```
.
├── .atom (atom files)
│
├── bin (scripts for install, backup, etc.)
│
├── home (symlinked to ~/)
│   ├── .gemrc (global config for ruby gems)
│   ├── .gitconfig (global git config)
│   ├── .gitignore_global (global gitignore)
│   ├── .zshrc (zsh/oh-my-zsh config)
│   └── .vimrc
│
├── .vim (vim files)
│
├── iterm2 (profile and settings for iterm)
│
└── sublime (symlinked to ~/Library/Application Support/Sublime Text 3)
    └── Packages
        └── User
            ├── *.sublime-settings
            └── *.tmTheme


```

* bin: scripts for installation, symlinking, backup

* home: files symlinked to ~/

* sublime: settings for sublime text 3 symlinked to sublime text application directory

* iterm2: settings, profile, icon


## Getting started

### Setup

in /~ run:

```
curl --silent https://raw.githubusercontent.com/klappradla/dotfiles/master/bin/install.sh | sh
```

This will clone the repo and prompt to symlink dotfiles and settings.

### SSH keys

Setup public key authentication with backup computer (in local network) over ssh.

1. Generate public key on local machine (if not done already)<br/>
  `ssh-keygen -t rsa`
2. Copy to remote machine<br/>
`scp ~/.ssh/id_rsa.pub user@remote.local:.ssh/authorized_keys2`


## Usage

### Dotfiles

My config for:

* git
* gemrc (install gems without rdoc)
* zsh / oh-my-zsh
* sublime text 3
* vim


### Backups

Tasks:

* weekly: `sh bin/backup.sh`  
transfer Dropbox and projects dir to external harddrive
* daily: `sh bin/transfer.sh`  
transfer projects dir to remote machine in local network
* media: `sh bin/transfer_media.sh`  
sync iTunes library with remote machine in local network


### iTerm setup

* import profile *klappradla* from ``/util/iterm2`
* import and use colorscheme `solarized_dark.itermcolors`
* I use `⇧⌘m` to maximize the window horizontally and vertially


### Sublime

My syntax theme, **klappradla** is inspired by the awesome [memco Oceanic](https://github.com/memco/Oceanic-tmTheme) and [atom one dark](https://github.com/atom/one-dark-syntax) themes.
![Alt text](screenshots/sublime.png?raw=true)


## Setup system from scratch

When setting up a new system, I prefer taking the time on cleaning up and focusing on what is really needed, rather than running a bootstrap script. Here some useful commands:


### OSX

###### show hidden files in finder
```
defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder
```

###### show all file endings
```
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
```

###### install xcode command line tools
```
xcode-select --install
```


#### set up ssh keys

###### check for ssh key, generating if it does not exist
```
[[ -f $pub ]] || ssh-keygen -t rsa
```

###### copy public key to clipboard
```
[[ -f $pub ]] && cat $pub | pbcopy
```


#### other

###### install homebrew
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

###### install recent zsh
```
brew install zsh
```

###### use recent zsh as default (prefer to system zsh)
```
sudo sh -c echo '/usr/local/bin/zsh' > /etc/shells
chsh -s /usr/local/bin/zsh
```
