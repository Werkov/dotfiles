alias ll="ls -l"
alias la="ls -a"
alias ..="cd .."
alias j="jobs"

# --Git aliases--
alias gst='git status'
alias gdf='git diff'
alias gad='git add'
alias gbl='git blame'
alias glog='git log --oneline'
alias gco='git commit'
alias grm='git rm'
alias gcp='git cherry-pick -x'
alias gdt='git describe --tags'
alias gda='git describe --all'

# --Bazaar aliases--
alias bst='bzr status'
alias bdf='bzr diff --diff-options -wu'
alias bad='bzr add'
alias blog='bzr log --line | less'

# -- Misc --
alias vlna='vlna -v KkSsVvZzOoUuAaIi'
alias mtime="/usr/bin/time -f \"real time:\t%e s\nmax memory:\t%M kB\n\""
alias muttf='mutt -F ~/.mutt/muttrc.fykos'
alias hd='hexdump -C'

alias cscope-init="find . \\( -name '*.c' -o -name '*.h' -o -name '*.cc' -o -name '*.hh' \\) ! -path './.*' | cscope -b -i -"
alias drafts='cd ~/projects/Werkov.github.io/_drafts'

alias sc='systemctl'
alias ssc='sudo systemctl'

alias ip='ip -c'

[ -f ~/.bash_aliases.local ] && . ~/.bash_aliases.local

