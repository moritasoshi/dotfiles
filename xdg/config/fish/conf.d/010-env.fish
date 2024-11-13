set -x PATH $GEM_HOME/bin $PATH
set -x PATH $XDG_DATA_HOME/npm/bin $PATH
set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH $HOME/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH $GOPATH/bin $PATH
# for flutterfilre cli
set -x PATH $HOME/.pub-cache/bin $PATH

set -x PATH $GOBIN $CARGO_HOME/bin $KREW_ROOT/bin $PATH
set -x PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH
set -x PATH $HOME/Library/Python/3.9/bin $PATH
set -x PATH $JAVA_HOME/bin $PATH

fish_add_path -g -p /usr/bin/flutter/bin
