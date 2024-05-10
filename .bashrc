# .bashrc


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

# Utility functions
function f {
	find . -iname "*$1*"
}

function mkcd {
	mkdir -p "$1"
	cd "$1"
}

if [ -f /usr/share/bash-completion/completions/git-prompt.sh ] ; then 
	source /usr/share/bash-completion/completions/git-prompt.sh
	PS1='\u@\h \w$(__git_ps1 " (%s)")> '
	export GIT_PS1_SHOWCOLORHINTS=1
fi

[ -f ~/.bashrc.local ] && . ~/.bashrc.local

