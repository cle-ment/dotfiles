#!/bin/sh

###############################################################################
# Installs everything that is common between work and private Mac setup.      #
# (!) Don't run this directly, since setup-work.sh and setup-private.sh will  #
# run this file for you already                                               #
###############################################################################


# Check for Oh My Zsh and install if we don't have it
if ! [ -d ~/.oh-my-zsh ]; then
  echo "-> Installing Oh My Zsh"
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
echo "-> Linking .dotfiles/.zshrc -> ~/.zshrc"
rm -rf $HOME/.zshrc && ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Install Powerlevel10k theme for zsh
if ! [ -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]; then
  echo "-> Installing Powerlevel10k theme for Oh My Zsh"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi


# Install zsh-autosuggestions
if ! [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
  echo "-> Installing zsh-autosuggestions plugin for Oh My Zsh"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# Check for Homebrew and install if we don't have it
if ! [ -x "$(command -v brew)" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew recipes
echo "-> Updating homebrew"
brew update
brew upgrade

# Install all our dependencies with bundle (See Brewfile)
echo "-> Installing homebrew dependencies"
brew tap homebrew/bundle
brew bundle --file $DOTFILES/common/Brewfile

# Symlink other dotfiles
echo "-> Sym-linking other dotfiles: .mackup.cfg, .nanorc, .gitconfig, .gitignore_global"
rm -rf $HOME/.gitconfig && ln -s $DOTFILES/.gitconfig $HOME/.gitconfig
rm -rf $HOME/.gitignore_global && ln -s $DOTFILES/.gitignore_global $HOME/.gitignore_global
rm -rf $HOME/.mackup.cfg && ln -s $DOTFILES/.mackup.cfg $HOME/.mackup.cfg
rm -rf $HOME/.nanorc && ln -s $DOTFILES/.nanorc $HOME/.nanorc

## The command below is not run by the common script but instead by the 
## work/private setup scripts because this will reload the shell
# echo "-> Setting up MacOS settings"
# source $DOTFILES/common/.macos

