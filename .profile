# SUSE Linux snippet
test -z "$PROFILEREAD" && . /etc/profile || true

export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export CDPATH="$CDPATH:$HOME"

# Ruby environment...
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

