# check if running Homebrew zsh
if [ ! -f /usr/local/bin/zsh ]; then
  echo "Warning: not using recent homebrew zsh!"
else
  echo "Using recent Homebrew zsh - nice!"
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
