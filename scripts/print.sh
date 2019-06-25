info() {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user() {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success() {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail() {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

print_info() {
  local data=$1
  while read -r data; do info "$data"; done
}

prompt() {
  local question=$1
  local response
  user "$question [y|n]"
  read -e response
  [ "$response" != "n" ]
}
