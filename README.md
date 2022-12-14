# Setting up a new Mac

## Backup your data

If you're migrating from an existing Mac, you should first make sure to backup all of your existing data. Go through the checklist below to make sure you didn't forget anything before you migrate.

- Did you commit and push any changes/branches to your git repositories?
- Did you backup all important documents that aren't synced to the cloud?
- Did you update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup`?

## Setting up your Mac

After backing up your old Mac you may now follow these install instructions to setup a new one.

1. Update macOS to the latest version through system preferences
2. (If needed, install commandline tools `xcode-select --install`)
3. [Generate a new public and private SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running:

   ```zsh
   curl https://raw.githubusercontent.com/cle-ment/.dotfiles/main/ssh.sh | sh -s "<your-email-address>"
   ```

4. Clone this repo to `~/.dotfiles` with:

   ```zsh
   git clone git@github.com:cle-ment/.dotfiles.git ~/.dotfiles
   ```

5. Run the installation with:

   ```zsh
   ~/.dotfiles/work/setup.sh
   ```

   for setting up a work computer or

   ```zsh
   ~/.dotfiles/private/setup.sh
   ```

   for a private computer.

6. After mackup is synced with your cloud storage, restore preferences by running `mackup restore`
7. Restart your computer to finalize the process

Your Mac is now ready to use!

## Cleaning your old Mac (optionally)

After you've set up your new Mac you may want to wipe and clean install your old Mac. Follow [this article](https://support.apple.com/guide/mac-help/erase-and-reinstall-macos-mh27903/mac) to do that. Remember to [backup your data](#backup-your-data) first!

## Remember to keep things in sync

When adding new software check first if it can be installed via brew and add it to this repo. The same goes for settings in your dotfiles as well as MacOS settings, whatever can be automated should be added to these setup files for future use.

## Acknowledgements

The initial version of my dotfiles were set up using https://github.com/driesvints/dotfiles as a starting point, thanks [Dries Vints](https://github.com/driesvints/) for sharing!
