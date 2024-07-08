set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_STATE_HOME $HOME/.local/state

set -x AWS_CONFIG_FILE $XDG_CONFIG_HOME/aws/config
set -x AWS_SHARED_CREDENTIALS_FILE $XDG_CONFIG_HOME/aws/credentials
set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x CSEARCHINDEX $XDG_CACHE_HOME/csearchindex
set -x GOBIN $HOME/.local/bin
set -x GOPATH $HOME/go
set -x VSCODE_PORTABLE "$XDG_DATA_HOME"/vscode
set -x _ZO_DATA_DIR $XDG_DATA_HOME/zoxide

set -x LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -x TERM xterm-256color-italic
set -x GPG_TTY (tty)
set -x EDITOR nvim
set -x VISUAL nvim
set -x DOTPATH $HOME/src/dotfiles
