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
│   ├── gitconfig        (global git config)
│   ├── gitignore_global (global gitignore)
│   ├── hushlogin        (omit "last login" message)
│   ├── tmux.conf        (config for tmux)
│   ├── tool-versions    (asdf default versions)
│   └── zshrc            (zsh/oh-my-zsh config)
│
├── iterm2 (profile and settings for iterm)
│
├── scripts (util scripts)
│
├── bin (executable scripts for setup, backups, etc.)
│
├── ssh (config for macOS ssh agent)
│
└── zsh (custom dir for oh-my-zsh, plugins, etc.)
```


## Installation

*(on new computer: set up ssh keys first)*

```sh
# start in home directory
cd

# clone repository
git clone --recursive git@github.com:klappradla/dotfiles.git

# navigate in
cd dotfiles

# run install script
bin/install

# run symlink script
bin/link
```

*See [docs](./DOCS.md) for additional help.*

## Backups

```sh
# copy example file and adapt for current machine
cp bin/backup.conf.example bin/backup.conf
```
