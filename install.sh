#!/usr/bin/env bash

# Process arguments

INTERACTIVE="-i"
KDE=kde

while [ $# -gt 0 ] ; do
	case "$1" in
		"-f")
			INTERACTIVE=
			shift
			;;
		"-k4")
			KDE=kde4
			shift
			;;
		*)
			echo "Unknown option '$1'"
			exit 1
			;;
	esac
done


# Set up paths

# debugging
# HOME=/tmp/home

pushd `dirname $0` &>/dev/null
ROOT="$PWD"
popd &>/dev/null
	
# Executive code

function linkIt() {	
	DIR="$HOME/`dirname $1`"
	SRC="$HOME/$1"
	DST="$ROOT/$1"

	# Temporary workaround
	SRC="${SRC/kde/$KDE}"
	DIR="${DIR/kde/$KDE}"
	

	if [ -L "$SRC" ] ; then
		echo "Skipping '$DST'"
		return
	fi

	mkdir -p "$DIR"
	ln $INTERACTIVE -s "$DST" "$SRC"
}

for f in `find $ROOT -type f -path "$ROOT/.*" ! -path "$ROOT/.git/*" ! -name "*.swp"` ; do
	name=${f#$ROOT/}

	linkIt "$name"
done

