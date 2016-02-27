#!/bin/bash

set -e
set -o nounset
set -o pipefail

# Check for Homebrew,
# Install if we don't have it
if ! which brew >/dev/null 2>&1; then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    # Update homebrew recipes
    echo "Updating homebrew"
    brew update
fi

declare -ra BREW=(
    coreutils
    findutils
    homebrew/dupes/grep
    git
    tig
    hub
    tree
    node
    rename
    zsh
    tmux
    vim
)

echo "installing binaries"
echo "brew install ${BREW[@]}"
brew install ${BREW[@]}

if ! brew cask --version >/dev/null 2>&1; then
    echo "Installing casks"
    brew install caskroom/cask/brew-cask
else
    echo "Updating cask"
    brew cask update
fi

declare -ra CASK=(
    alfred
    appcleaner
    dropbox
    firefox
    google-chrome
    iterm2
    skype
    transmission
    vagrant
    virtualbox
    vlc
)

echo "brew cask install ${CASK[@]}"
brew cask install ${CASK[@]}

#brew cask link alfred

brew tap caskroom/fonts

declare -ra FONTS=(
    font-roboto
)

echo "installing fonts..."
echo "brew cask install ${FONTS[@]}"
brew cask install ${FONTS[@]}
