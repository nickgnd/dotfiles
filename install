#!/bin/bash
readonly DOTFILES_DIR="$HOME/dotfiles"

is_symlink() {
  local file_name=$1
  [ -h "$file_name" ]
}

file_exists() {
  local file_name=$1
  [ -e "$file_name" ]
}

remove_old_link() {
  local file=$1
  is_symlink "$file" &&
  echo "Remove old symlink: $file" &&
  rm -rf "$file"
}

is_file() {
  local file=$1
  file_exists "$file" || return 0
  echo -e "Warning: $file is a not a symlink! Go double check before removing!\n" &&
  return 1
}

link_files() {
  local target=$1
  local link=$2

  remove_old_link "$link" || is_file "$link" &&
  ln -s "$target" "$link" &&
  echo -e "Link $link to $target\n"
}

prompt_user() {
  local question=$1
  local response
  read -rp "Symlink $question? (Y/n) " response
  [ "$response" != "n" ]
}

symlink() {
  local targets=$1
  local link_path=$2
  for target in $targets; do
    link_files "$DOTFILES_DIR/$target" "$link_path$(basename "$target")"
  done
}

install_asdf() {
  [ ! -d "$HOME/.asdf" ] &&
    echo "Installing asdf..." &&
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.0
}

install_oh_my_zsh() {
  [ ! -d "$HOME/.oh-my-zsh" ] &&
    echo "Installing oh-my-zsh..." &&
    curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh

}

main() {
  install_oh_my_zsh
  install_asdf

  prompt_user "dotfiles for ~/" &&
  symlink "home/*" "$HOME/."

  prompt_user "Atom Editor files" &&
  symlink "atom/*" "$HOME/.atom/"

  prompt_user "LaunchD Agents" &&
    for target in agents/*.plist; do
      prompt_user "$target" &&
      symlink "$target" "$HOME/Library/LaunchAgents/"
    done

  prompt_user "Spectacle shortcuts" &&
  symlink "config/Spectacle" "$HOME/Library/Application Support/"

  prompt_user "Karabiner config" &&
  symlink "config/karabiner" "$HOME/.config/"

  prompt_user "Neovim config" &&
  symlink "config/nvim" "$HOME/.config/"

  prompt_user "ssh config" &&
  symlink "ssh/config" "$HOME/.ssh/"
}
main
