#!/bin/bash

set -e
set -o nounset
set -o pipefail

# Make sure cask applications are linked in correct folder
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

echo "Make sure you have installed xcode & App Store Apps."
# no solution to automate AppStore installs
read -p "Press any key to continue... " -n1 -s
echo  '\n'

# Link files from other location
if [ -d "$HOME/InSync/dotfiles/ssh" ] && [ ! -L "$HOME/.ssh" ]; then
    echo "Linking SSH config"
    ln -s $HOME/InSync/dotfiles/ssh $HOME/.ssh
else
    echo "Make sure you have InSync installed in $HOME/InSync"
fi


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

echo "Upgrading homebrew packages"
brew upgrade

echo "installing binaries"
brew install coreutils
brew install findutils
brew install homebrew/dupes/grep
brew install git
brew install tig
brew install hub
brew install tree
brew install node
brew install rename
brew install zsh
brew install tmux
brew install vim

if ! brew cask --version >/dev/null 2>&1; then
    echo "Installing casks"
    brew install caskroom/cask/brew-cask
else
    echo "Updating cask"
    brew cask update
fi

echo "Installing binaries"
brew cask install alfred
brew cask install appcleaner
brew cask install dropbox
brew cask install insync
brew cask install firefox
brew cask install google-chrome
brew cask install skype
brew cask install transmission
brew cask install vlc
brew cask install postman
brew cask install omnipresence
brew cask install omnifocus
brew cask install slack
brew cask install toggldesktop
brew cask install 1password
brew cask install duet
brew cask install bartender

echo "Installing design tools"
brew cask install sketch

echo "Installing developer tools"
brew cask install paw
brew cask install tower
#brew cask install vagrant
#brew cask install virtualbox
brew cask install iterm2
brew cask install phpstorm
brew cask install datagrip

brew tap caskroom/fonts

declare -ra FONTS=(
    font-roboto
)

echo "installing fonts..."
echo "brew cask install ${FONTS[@]}"
brew cask install ${FONTS[@]}
