info() {
  local msg=$1
  printf "\r  [ \033[00;34m..\033[0m ] $msg\n"
}

user() {
  local msg=$1
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success() {
  local msg=$1
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail() {
  local msg=$1
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

print_info() {
  local data
  while read -r data; do info "$data"; done
}

prompt() {
  local question=$1
  local response
  user "$question [y|n]"
  read -re response
  [ "$response" != "n" ]
}
