#!/usr/bin/env bash

ROOT="$(dirname "${BASH_SOURCE}")"

function doIt() {
	rsync --exclude ".git/" --exclude "install.sh" \
		--exclude "README.md" -avh --no-perms "$ROOT" "$HOME"
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
