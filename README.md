# ~/dotfiles

How to setup an environment (unix/osx) the way I like it.   
Inspired by [paulmillr's](https://github.com/paulmillr/dotfiles), [ryanb's](https://github.com/ryanb/dotfiles) and lots of other great **dotfiles** repos out there. Thanks!

## General

I use [zsh](http://www.zsh.org/) as a shell, [iTerm2](http://iterm2.com/) as a terminal replacement and the [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) framework to manage my settings there. On text-editors, I switch between Vim and Github's Atom, using [vim-plug](https://github.com/junegunn/vim-plug) for managing my Vim plugins. For colors, I like Ethan Schoonover's awesome [solarized](http://ethanschoonover.com/solarized) scheme and use it in iTerm, Vim and Atom.

Fontwise, I use Apple's [Monaco](https://github.com/cstrap/monaco-font) font in size `13pt` in both, Atom and Vim *(it's one of the few fonts looking okish in size 13)*.


## Directory

```
.
├── .atom (atom files)
│
├── agents (launchd scripts)
│
├── backups (backup scripts)
│
├── home (symlinked to ~/)
│   ├── .gemrc (global config for ruby gems)
│   ├── .gitconfig (global git config)
│   ├── .gitignore_global (global gitignore)
│   ├── .zshrc (zsh/oh-my-zsh config)
│   └── .vimrc
│
├── iterm2 (profile and settings for iterm)
│
└── zsh (custom dir for oh-my-zsh)


```


## Getting started

#### Dependencies
* [Homebrew](http://brew.sh/)
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [vim-plug](https://github.com/junegunn/vim-plug)
* [iTerm2](https://www.iterm2.com/)

### Install

```
curl --silent https://raw.githubusercontent.com/klappradla/dotfiles/master/install.sh | sh
```

This will clone the repo and prompt to symlink dotfiles and settings.


### Symbolic links

```
sh symlink.sh
```

Prompts which parts of the dotfiles should be symlinked *(old links are replaced by new ones)*.

### SSH keys

Setup public key authentication with backup computer (in local network) over ssh.

1. Generate public key on local machine (if not done already)<br/>
  `ssh-keygen -t rsa`
2. Copy to remote machine<br/>
`scp ~/.ssh/id_rsa.pub user@remote.local:.ssh/authorized_keys2`


## Usage

### Dotfiles

Config for:

* git
* gemrc (install gems without rdoc)
* zsh / oh-my-zsh
* atom
* vim


### Backups

*(currently reworking this)*


### iTerm setup

* point *Load preferences from custom folder or URL* to `~/dotfiles/iterm2`
* if the settings are not applied automatically, run:    
  `defaults read com.googlecode.iterm2`
* use `⇧⌘m` to maximize the window horizontally and vertially

![iterm](screenshots/iterm.png?raw=true)


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
