#!/usr/bin/env bash

# Process arguments

INTERACTIVE="-i"

if [ "x$1" = "x-f" ] ; then
	INTERACTIVE=
fi

# Set up paths

# debugging
# HOME=/tmp/home

pushd `dirname $0` &>/dev/null
ROOT="$PWD"
popd &>/dev/null
	
# Executive code

function linkIt() {	
	SRC="$HOME/`basename $1`"
	DST="$1"
	if [ -L "$SRC" ] ; then
		echo "Skipping '$DST'"
		return
	fi
	ln $INTERACTIVE -s "$DST" "$SRC"
}

for f in $ROOT/.* ; do
	if [ "$f" = "$ROOT/."\
	    -o "$f" = "$ROOT/.."\
	    -o "$f" = "$ROOT/.git"\
	    ] ; then
		continue
	fi
	linkIt "$f"
done

