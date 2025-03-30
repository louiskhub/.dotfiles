#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  export ZDOTDIR="$HOME/.dotfiles/.config/zsh" # make sure $ZSH is set correctly during install
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Removes .zshenv from $HOME (if it exists) and symlinks the .zshenv file from the .dotfiles
rm -f $HOME/.zshenv
ln -sw $HOME/.dotfiles/.config/zsh/.zshenv

# Update Homebrew recipes
brew update
# Install all our dependencies with bundle (See Brewfile)
brew bundle --file ./Brewfile

# Removes default ghostty terminal config (if exists) and symlinks the custom config. This is needed because HOME/.dotfiles/.config is not set on MacOS by default
rm $HOME/Library/Application\ Support/com.mitchellh.ghostty/config
ln -sw $HOME/.dotfiles/.config/ghostty/config $HOME/Library/Application\ Support/com.mitchellh.ghostty/config

# Removes any user configs for VSCode (if exist) and symlinks custom config.
rm -f ~/Library/Application\ Support/Code/User/settings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -sw $HOME/.dotfiles/.config/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -sw $HOME/.dotfiles/.config/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json

# Set macOS preferences - we will run this last because this will reload the shell (might require a restart for all settings to take effect)
source ./.macos
