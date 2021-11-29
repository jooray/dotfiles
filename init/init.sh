#!/bin/bash

if [ $(uname) == "Darwin" ];then
		~/init/macos
		~/init/brew.sh
		~/init/brew-cask.sh
    ~/init/macos-notifications
	fi

pip install --user powerline-status
pip install segno # for QR codes using qr function

