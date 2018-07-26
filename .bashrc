# .bashrc

export PATH="$HOME/bin:$PATH"
export CDPATH="$CDPATH:$HOME"


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# User specific aliases and functions
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Ruby environment...
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Utility functions
function f {
	find . -iname "*$1*"
}

function mkcd {
	mkdir -p "$1"
	cd "$1"
}

[ -f ~/.bashrc.local ] && . ~/.bashrc.local

