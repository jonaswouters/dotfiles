#!/bin/bash

set -e
set -o nounset
set -o pipefail

echo "Updating cask"
brew cask update

declare -ra CASK=(
    adobe-creative-cloud
)

echo "brew cask install ${CASK[@]}"
brew cask install ${CASK[@]}

