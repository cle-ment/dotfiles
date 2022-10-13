#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Install Powerlevel10k theme for Zsh and plugins
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file $DOTFILES/Brewfile

# Symlink other dotfiles
rm -rf $HOME/.mackup.cfg && ln -s $DOTFILES/.mackup.cfg $HOME/.mackup.cfg
rm -rf $HOME/.nanorc && ln -s $DOTFILES/.nanorc $HOME/.nanorc
rm -rf $HOME/.gitconfig && ln -s $DOTFILES/.gitconfig $HOME/.gitconfig
rm -rf $HOME/.gitignore_global && ln -s $DOTFILES/.gitignore_global $HOME/.gitignore_global

# Restore Mackup settings
mackup restore

# Set macOS preferences - we will run this last because this will reload the shell
source $DOTFILES/.macos
