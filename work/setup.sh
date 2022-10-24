#!/bin/sh

echo "-> Setting up your work Mac."

# First run common install
$HOME/.dotfiles/common/setup.sh

# Install all our dependencies with bundle (See Brewfile)
echo "-> Installing homebrew dependencies (work)"
brew tap homebrew/bundle
brew bundle --file $DOTFILES/work/Brewfile

# Symlink other dotfiles
echo "-> Sym-linking other dotfiles (work)"
# none here right now

# Set macOS preferences, we will run this last because this will reload the shell
echo "-> Setting up MacOS settings"
source $DOTFILES/.macos