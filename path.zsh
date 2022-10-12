# Load dotfiles binaries
export PATH="$DOTFILES/bin:$PATH"

# Execute apps from homebrew install dir
export PATH=/usr/local/bin:$PATH

# Make sure coreutils are loaded before system commands
# I've disabled this for now because I only use "ls" which is
# referenced in my aliases.zsh file directly.
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
