#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;
git submodule update --init

function doIt() {
	if ! command -v rsync > /dev/null 2>&1; then
		echo "rsync is required but not installed."
		if command -v pacman > /dev/null 2>&1; then
			echo "Install it with: sudo pacman -S rsync"
		fi
		return 1
	fi

	exclude_options=""
  if [ -d ~/.vim/janus ]; then
		exclude_options="--exclude .vimrc --exclude .vim --exclude .gvimrc"
		echo "Warning! I stopped using Janus, please uninstall it, or simply copy .vim* over manually"
  fi

	if [ -d /usr/share/omarchy ]; then
		echo "Omarchy detected: its bash setup is sourced from ~/.bash_profile, not replaced."
		echo "Anything you had added to ~/.bashrc yourself is kept in the backup below."
	fi

	# Every file we overwrite is kept, so nothing (Omarchy's ~/.bashrc included)
	# is lost silently.
	backup_dir="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "EXAMPLES.md" --exclude "LICENSE-MIT.txt" ${exclude_options} \
		--backup --backup-dir="${backup_dir}" -avh --no-perms . ~;

	if [ -d "${backup_dir}" ]; then
		echo "Replaced files backed up to ${backup_dir}"
	fi

	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
