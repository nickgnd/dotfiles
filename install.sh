#!/bin/bash
readonly DOTFILES_DIR="$HOME/dotfiles"

is_symlink() {
  local file_name=$1
  [[ -h $file_name ]]
}

file_exists() {
  local file_name=$1
  [[ -e $file_name ]]
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
  echo "Warning: $file is a not a symlink! Go double check before removing!\n" &&
  return 1
}

link_files() {
  local target=$1
  local link=$2

  remove_old_link "$link" || is_file "$link" &&
  ln -s "$target" "$link" &&
  echo "Link $link to $target\n"
}

prompt_user() {
  local question=$1
  local response
  read -p "Symlink $question? (Y/n) " response
  [[ "$response" != "n" ]]
}

symlink() {
  local targets=$1
  local link_path=$2
  for target in $targets; do
    link_files "$DOTFILES_DIR/$target" "$link_path$(basename $target)"
  done
}

main() {
  prompt_user "dotfiles for ~/" &&
  symlink "home/*" "$HOME/."

  prompt_user "LaunchD Agents" &&
    for target in agents/*.plist; do
      prompt_user "$target" &&
      symlink "$target" "$HOME/Library/LaunchAgents/"
    done

  prompt_user "Atom Editor files" &&
  symlink "atom/*" "$HOME/.atom/"
}
main
