#!/bin/sh

echo "-> Setting up your work Mac."

# First run common install
$HOME/.dotfiles/common/setup.sh

# Install all our dependencies with bundle (See Brewfile)
echo "-> Installing homebrew dependencies (private)"
brew tap homebrew/bundle
brew bundle --file $DOTFILES/private/Brewfile

# Symlink other dotfiles
echo "-> Sym-linking other dotfiles (private)"
cp -s $DOTFILES/private/aliases.zsh $DOTFILES/private-aliases.zsh 

# Set macOS preferences, we will run this last because this will reload the shell
echo "-> Setting up MacOS settings"
source $DOTFILES/.macos