#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

brew cask install alfred
#brew cask install flux
brew cask install iterm2
brew cask install tor-browser
brew cask install brave-browser
brew cask install onionshare
ln -s /Applications/OnionShare.app/Contents/MacOS/onionshare ~/.bin/
brew cask install vlc
#brew cask install spectacle
brew cask install disk-inventory-x
brew cask install licecap
brew cask install appcleaner
brew cask install handbrake
brew cask install the-unarchiver
brew cask install java
brew cask install mark-text
brew cask install keybase
brew cask install vimr
brew cask install dozer

# quicklook plugins
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install qlprettypatch
brew cask install quicklook-csv
brew cask install webpquicklook
brew cask install qlcolorcode
brew cask install suspicious-package

# fonts
brew tap homebrew/cask-fonts
brew cask install font-inconsolata
brew cask install font-fira-code
brew cask install font-hack

brew cask install webtorrent
