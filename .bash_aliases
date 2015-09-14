alias ll="ls -l"
alias la="ls -a"

# --Git aliases--
alias gst='git status'
alias gdf='git diff'
alias gad='git add'
alias glog='git log --oneline'
alias gco='git commit'
alias grm='git rm'

# --Bazaar aliases--
alias bst='bzr status'
alias bdf='bzr diff --diff-options -wu'
alias bad='bzr add'
alias blog='bzr log --line | less'

# -- Misc --
alias vlna='vlna -v KkSsVvZzOoUuAaIi'
alias mtime="/usr/bin/time -f \"real time:\t%e s\nmax memory:\t%M kB\n\""
alias muttf='mutt -f +fykos/INBOX'

alias cscope-init="find . \\( -name '*.c' -o -name '*.h' \\) ! -path './.*' | cscope -b -i -"
