#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

brew install alfred
#brew install flux
brew install iterm2
brew install tor-browser
brew install brave-browser
brew install onionshare
ln -s /Applications/OnionShare.app/Contents/MacOS/onionshare ~/.bin/
brew install vlc
#brew install spectacle
brew install disk-inventory-x
brew install licecap
brew install appcleaner
brew install handbrake
brew install the-unarchiver
brew install java
brew install mark-text
brew install keybase
brew install vimr
brew install dozer

# quicklook plugins
brew install qlmarkdown
brew install quicklook-json
brew install qlprettypatch
brew install quicklook-csv
brew install webpquicklook
brew install qlcolorcode
brew install suspicious-package

# fonts
brew tap homebrew/cask-fonts
brew install font-inconsolata
brew install font-fira-code
brew install font-hack

brew install webtorrent
