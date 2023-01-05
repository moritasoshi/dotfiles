set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_STATE_HOME $HOME/.local/state

set -x AWS_CONFIG_FILE $XDG_CONFIG_HOME/aws/config
set -x AWS_SHARED_CREDENTIALS_FILE $XDG_CONFIG_HOME/aws/credentials
set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x CSEARCHINDEX $XDG_CACHE_HOME/csearchindex
set -x GEMRC $XDG_CONFIG_HOME/gem/gemrc
# set -x GEM_HOME $XDG_DATA_HOME/gem
# set -x GEM_SPEC_CACHE $XDG_CACHE_HOME//gem
set -x GOBIN $HOME/.local/bin
set -x GOPATH $HOME/go
# set -x JAVA_HOME $(/usr/libexec/java_home -v "1.8")
# set -x JAVA_HOME $(/usr/libexec/java_home -v "11")
set -x JAVA_HOME $(/usr/libexec/java_home -v "17")
set -x KREW_ROOT $XDG_DATA_HOME/krew
set -x NODE_REPL_HISTORY $XDG_DATA_HOME/node_repl_history
# set -x RBENV_ROOT $XDG_DATA_HOME/rbenv
set -x TEALDEER_CACHE_DIR $XDG_CACHE_HOME/tldr
set -x VSCODE_PORTABLE "$XDG_DATA_HOME"/vscode
set -x _ZO_DATA_DIR $XDG_DATA_HOME/zoxide


set -x LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -x TERM xterm-256color-italic
set -x GPG_TTY (tty)
set -x EDITOR nvim
set -x VISUAL nvim
set -x DOTPATH $HOME/src/dotfiles


set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH $HOME/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH $GOPATH/bin $PATH
set -x PATH $HOME/.rbenv/bin $PATH

set -x PATH $GOBIN $CARGO_HOME/bin $KREW_ROOT/bin $PATH
# set -x PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH
# set -x PATH /opt/homebrew/opt/coreutils/libexec/gnubin $PATH
# set -x PATH /opt/homebrew/opt/findutils/libexec/gnubin $PATH
# set -x PATH /opt/homebrew/opt/gnu-sed/libexec/gnubin $PATH
# set -x PATH /opt/homebrew/opt/gnu-tar/libexec/gnubin $PATH
# set -x PATH /opt/homebrew/opt/make/libexec/gnubin $PATH
# set -x PATH /opt/homebrew/opt/grep/libexec/gnubin $PATH
# set -x PATH /opt/homebrew/opt/bison/bin $PATH
set -x PATH $HOME/Library/Python/3.9/bin $PATH
set -x PATH $HOME/Documents/github.com/hsbt/hsbt/toolbox/exe $PATH
set -x PATH $JAVA_HOME/bin $PATH
