# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

export EDITOR=/usr/bin/vim
bind -e -a \ce
bind \ce edit_command_buffer

# Set up environment
set -x CDPATH . $HOME
set -x PATH $HOME/bin $PATH

# --Git aliases--
alias gst 'git status'
alias gdf 'git diff'
alias gad 'git add'
alias gbl 'git blame'
alias glog 'git log --oneline'
alias gco 'git commit'
alias grm 'git rm'
alias gcp 'git cherry-pick -x'

# --Bazaar aliases--
alias bst 'bzr status'
alias bdf 'bzr diff --diff-options -wu'
alias bad 'bzr add'
alias blog 'bzr log --line | less'

# -- Misc --
alias mtime "/usr/bin/time -f \"real time:\t%e s\nmax memory:\t%M kB\n\""
alias muttf 'mutt -F ~/.mutt/muttrc.fykos'
alias ip 'ip -c'

alias cscope-init "find . \\( -name '*.c' -o -name '*.h' -o -name '*.cc' -o -name '*.hh' \\) ! -path './.*' | cscope -b -i -"
alias drafts 'cd ~/projects/Werkov.github.io/_drafts'

[ -f ~/.fish_aliases.local ] ; and source ~/.fish_aliases.local

# Utility functions
function f
	find . -iname "*$argv[1]*"
end


# Git functions
# function fish_prompt
#     set_color normal
#     echo -n (whoami)'@'(hostname)' '
#     if set -l git_branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)
#       set_color yellow  
#       echo -n ''$git_branch' '
#     end
#     set_color green
#     echo -n (prompt_pwd)
#     set_color normal
#     echo -n '> '
# end

function gcnt
    git show -s --oneline $argv[1] | git name-rev --stdin
end

function gfp
    set hash (git show -s --format="%H" $argv[1])
    set filename (git show -s --format="%f" $argv[1]).patch
    set desc (git describe --contains $hash)

    echo "$hash ($desc) > $argv[2]/$filename"
    git format-patch --add-header="Git-commit: $hash" \
                     --add-header="Patch-mainline: $desc" \
		     --add-header="References: TODO" \
		     --stdout \
		     $hash -1 >$argv[2]/$filename
end

function gcinfo
    for h in $argv
        set desc (git describe --contains $h --match="v*")
        git show -s --format="%h (\"%s\") $desc" $h
    end
end

