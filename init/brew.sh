#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Turn off analytics
brew analytics off

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# some packages are only required/wanted on Mac OS X
if [ $(uname) == "Darwin" ]
	then

				# Install GNU core utilities (those that come with OS X are outdated).
				# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
				brew install coreutils
        ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"
				# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
				brew install findutils
				# Install GNU `sed`, overwriting the built-in `sed`.
				brew install gnu-sed --with-default-names
				# Install a modern version of bash
				# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
				# running `chsh`. To do so, run `sudo chsh -s /usr/local/bin/bash`.
				brew install bash
				brew install bash-completion2

				# Switch to using brew-installed bash as default shell
        if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
          echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
          chsh -s "${BREW_PREFIX}/bin/bash";
        fi;

				# Install more recent versions of some OS X tools.
				brew install vim --with-override-system-vi
				brew install macvim --env-std
				brew install grep
				brew install openssh
				brew install screen
        brew install php
        brew install gmp


				# Install font tools.
				brew tap bramstein/webfonttools
				brew install sfnt2woff
				brew install sfnt2woff-zopfli
				brew install woff2

				brew install dark-mode

				# command line interface for Mac App Store
				brew install mas

        # command line interface for macOS
        brew install m-cli

        brew install reattach-to-user-namespace # tmux copy to macos clipboard
  fi

# Install some other useful utilities like `sponge`.
brew install moreutils
brew install mosh
brew install jq
brew install wget

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
#brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xz

# Install other useful binaries.

# better grep
brew install ack
# better ack
brew install the_silver_searcher

#brew install exiv2
brew install git
brew install git-extras
brew install git-lfs
brew install gs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install speedtest_cli
brew install ssh-copy-id
brew install testssl
brew install tree
brew install webkit2png
brew install zopfli
brew install zstd
brew install z
brew install selecta
brew install tmux
brew install gnupg
brew install gpgme
brew install detox

# Install password generator
brew install pwgen

# Install Node.js. Note: this installs `npm` too, using the recommended
# installation method.
brew install node

# Install io.js
#brew install iojs

# Install generic colourizer and other tools for highlighting
brew install grc
brew install source-highlight
brew install vimpager

# Install atool - provides apack and aunpack - who wants to remember all
# zip/tar/7z/... switches?
brew install atool
brew install ffmpeg
brew install gifsicle

# metadata removal tool (privacy)
brew install mat
brew install entr

# some build tools (required for YouCompleteMe for example)
brew install cmake
brew install go

brew install dnscrypt-proxy

brew install fpp

brew install rclone

brew install ffsend
brew install magic-wormhole

brew install nnn

cat << EOF

For setup instructions for dnscrypt-proxy (encrypted DNS requests) read:
https://juraj.bednar.io/blog/2018/04/02/more-privacy-with-dnscrypt/

EOF

# Remove outdated versions from the cellar.
brew cleanup

