# check if running Homebrew zsh
if [ ! -f /usr/local/bin/zsh ]; then
  echo "not using recent homebrew zsh - install first"
  exit
else
  echo "using recent Homebrew zsh - nice!"
fi

# clone git REPO
DIR="$HOME"
REPO="https://github.com/klappradla/dotfiles.git"

echo "cd into $DIR"
  cd $DIR

echo "clone $REPO into $DIR"
  git clone --recursive https://github.com/klappradla/dotfiles.git
echo "cd into dotfiles DIR"
  cd dotfiles

# symlink dotfiles
sh symlink.sh
