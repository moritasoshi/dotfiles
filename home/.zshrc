SCRIPT_DIR=$HOME/src/dotfiles/home/zsh

source ${SCRIPT_DIR}/.p10k.zsh
source ${SCRIPT_DIR}/alias.zsh
source ${SCRIPT_DIR}/config.zsh
source ${SCRIPT_DIR}/functions.zsh
source ${SCRIPT_DIR}/plugin.zsh

# editorはvimを使う
export EDITOR=vim
export VISUAL=$EDITOR

# 重いので使う時だけ
# source ${SCRIPT_DIR}/jenv.zsh
# source ${SCRIPT_DIR}/pyenv.zsh

## emacs keybind
bindkey -e

# peco
function peco-history-selection() {
  BUFFER=$(history -n 1 | tail -r | awk '!a[$0]++' | peco)
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

function peco-src() {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^S' peco-src

# ghq
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

## ヒストリを保存するファイル
HISTFILE=~/.zsh_history
## メモリ上のヒストリ数。
## 大きな数を指定してすべてのヒストリを保存するようにしている。
HISTSIZE=10000000
## 保存するヒストリ数
SAVEHIST=$HISTSIZE
## ヒストリファイルにコマンドラインだけではなく実行時刻と実行時間も保存する。
setopt extended_history
## 同じコマンドラインを連続で実行した場合はヒストリに登録しない。
setopt hist_ignore_dups
## スペースで始まるコマンドラインはヒストリに追加しない。
setopt hist_ignore_space
## すぐにヒストリファイルに追記する。
setopt inc_append_history
## zshプロセス間でヒストリを共有する。
setopt share_history
## C-sでのヒストリ検索が潰されてしまうため、出力停止・開始用にC-s/C-qを使わない。
setopt no_flow_control
## cd 無しでディレクトリ移動する
setopt auto_cd
## git show HEAD^ したい
setopt NO_NOMATCH

cdpath=(.. ~ ~/memo)
export PGDATA=/usr/local/var/postgres
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
# export JAVA_HOME=$(/usr/libexec/java_home -v "11")
export JAVA_HOME=$(/usr/libexec/java_home -v "1.8")
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
if [ -e $HOME/.rvm/bin ]; then export PATH="$PATH:$HOME/.rvm/bin"; fi

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/morita/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/morita/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/morita/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/morita/google-cloud-sdk/completion.zsh.inc'; fi
