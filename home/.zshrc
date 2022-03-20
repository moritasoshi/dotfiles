SCRIPT_DIR=$HOME/.zsh

## emacs keybind
bindkey -e

ZSH_FILES="alias,config,functions,p10k,plugin"
for file in $(echo $ZSH_FILES | sed "s/,/ /g"); do
  source $HOME/.zsh/$file.zsh
done

export LANG="en_US.UTF-8"
# editorはvimを使う
export EDITOR=nvim
export VISUAL=$EDITOR
export DOTPATH=~/src/dotfiles
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# 重いので使う時だけ
# source ${SCRIPT_DIR}/jenv.zsh
# source ${SCRIPT_DIR}/pyenv.zsh


# peco
function peco-history-selection() {
  BUFFER=$(history -n 1 | tail -r | awk '!a[$0]++' | peco --query "$BUFFER")
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

function peco-src() {
  local selected_dir=$(fd . ~/src/ --maxdepth 1 | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^S' peco-src

# easiest way to connect remote servers
peco-ssh() {
  local selected_host=$(cat ~/.ssh/config | grep -oE "^Host \w.*" | cut -d" " -f2 | peco --query "$LBUFFER")
  if [ -n "$selected_host" ]; then
    BUFFER="ssh ${selected_host}"
  fi
}
zle -N peco-ssh
bindkey '^E' peco-ssh

bindkey '^o' clear-screen

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

export PGDATA=/usr/local/var/postgres
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export JAVA_HOME=$(/usr/libexec/java_home -v "11")
# export JAVA_HOME=$(/usr/libexec/java_home -v "1.8")
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
if [ -e $HOME/.rvm/bin ]; then export PATH="$PATH:$HOME/.rvm/bin"; fi

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/morita/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/morita/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/morita/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/morita/google-cloud-sdk/completion.zsh.inc'; fi

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/bin:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


LS_COLORS='no=00;38;5;15:rs=0:di=00;38;5;6:ln=00;38;5;2:mh=00:pi=48;5;0;38;5;3;01:so=48;5;0;38;5;3;01:do=48;5;0;38;5;3;01:bd=48;5;0;38;5;15;01:cd=48;5;0;38;5;15;01:or=48;5;0;38;5;1:su=48;5;1;38;5;3:sg=48;5;1;38;5;3:ca=30;41:tw=48;5;2;38;5;3:ow=48;5;0;38;5;6:st=48;5;6;38;5;3:ex=00;38;5;2:*.tar=00;38;5;4:*.tgz=00;38;5;4:*.arj=00;38;5;4:*.taz=00;38;5;4:*.lzh=00;38;5;4:*.lzma=00;38;5;4:*.tlz=00;38;5;4:*.txz=00;38;5;4:*.zip=00;38;5;4:*.z=00;38;5;4:*.Z=00;38;5;4:*.dz=00;38;5;4:*.gz=00;38;5;4:*.lz=00;38;5;4:*.xz=00;38;5;4:*.bz2=00;38;5;4:*.bz=00;38;5;4:*.tbz=00;38;5;4:*.tbz2=00;38;5;4:*.tz=00;38;5;4:*.deb=00;38;5;4:*.rpm=00;38;5;4:*.jar=00;38;5;4:*.rar=00;38;5;4:*.ace=00;38;5;4:*.zoo=00;38;5;4:*.cpio=00;38;5;4:*.7z=00;38;5;4:*.rz=00;38;5;4:*.apk=00;38;5;4:*.gem=00;38;5;4:*.jpg=00;38;5;3:*.JPG=00;38;5;3:*.jpeg=00;38;5;3:*.gif=00;38;5;3:*.bmp=00;38;5;3:*.pbm=00;38;5;3:*.pgm=00;38;5;3:*.ppm=00;38;5;3:*.tga=00;38;5;3:*.xbm=00;38;5;3:*.xpm=00;38;5;3:*.tif=00;38;5;3:*.tiff=00;38;5;3:*.png=00;38;5;3:*.PNG=00;38;5;3:*.svg=00;38;5;3:*.svgz=00;38;5;3:*.mng=00;38;5;3:*.pcx=00;38;5;3:*.dl=00;38;5;3:*.xcf=00;38;5;3:*.xwd=00;38;5;3:*.yuv=00;38;5;3:*.cgm=00;38;5;3:*.emf=00;38;5;3:*.eps=00;38;5;3:*.CR2=00;38;5;3:*.ico=00;38;5;3:*.tex=00;38;5;7:*.rdf=00;38;5;7:*.owl=00;38;5;7:*.n3=00;38;5;7:*.ttl=00;38;5;7:*.nt=00;38;5;7:*.torrent=00;38;5;7:*.xml=00;38;5;7:*Makefile=00;38;5;7:*Rakefile=00;38;5;7:*Dockerfile=00;38;5;7:*build.xml=00;38;5;7:*rc=00;38;5;7:*1=00;38;5;7:*.nfo=00;38;5;7:*README=00;38;5;7:*README.txt=00;38;5;7:*readme.txt=00;38;5;7:*.md=00;38;5;7:*README.markdown=00;38;5;7:*.ini=00;38;5;7:*.yml=00;38;5;7:*.cfg=00;38;5;7:*.conf=00;38;5;7:*.h=00;38;5;7:*.hpp=00;38;5;7:*.c=00;38;5;7:*.cpp=00;38;5;7:*.cxx=00;38;5;7:*.cc=00;38;5;7:*.objc=00;38;5;7:*.sqlite=00;38;5;7:*.go=00;38;5;7:*.sql=00;38;5;7:*.csv=00;38;5;7:*.log=00;38;5;8:*.bak=00;38;5;8:*.aux=00;38;5;8:*.lof=00;38;5;8:*.lol=00;38;5;8:*.lot=00;38;5;8:*.out=00;38;5;8:*.toc=00;38;5;8:*.bbl=00;38;5;8:*.blg=00;38;5;8:*~=00;38;5;8:*#=00;38;5;8:*.part=00;38;5;8:*.incomplete=00;38;5;8:*.swp=00;38;5;8:*.tmp=00;38;5;8:*.temp=00;38;5;8:*.o=00;38;5;8:*.pyc=00;38;5;8:*.class=00;38;5;8:*.cache=00;38;5;8:*.aac=00;38;5;1:*.au=00;38;5;1:*.flac=00;38;5;1:*.mid=00;38;5;1:*.midi=00;38;5;1:*.mka=00;38;5;1:*.mp3=00;38;5;1:*.mpc=00;38;5;1:*.ogg=00;38;5;1:*.opus=00;38;5;1:*.ra=00;38;5;1:*.wav=00;38;5;1:*.m4a=00;38;5;1:*.axa=00;38;5;1:*.oga=00;38;5;1:*.spx=00;38;5;1:*.xspf=00;38;5;1:*.mov=00;38;5;1:*.MOV=00;38;5;1:*.mpg=00;38;5;1:*.mpeg=00;38;5;1:*.m2v=00;38;5;1:*.mkv=00;38;5;1:*.ogm=00;38;5;1:*.mp4=00;38;5;1:*.m4v=00;38;5;1:*.mp4v=00;38;5;1:*.vob=00;38;5;1:*.qt=00;38;5;1:*.nuv=00;38;5;1:*.wmv=00;38;5;1:*.asf=00;38;5;1:*.rm=00;38;5;1:*.rmvb=00;38;5;1:*.flc=00;38;5;1:*.avi=00;38;5;1:*.fli=00;38;5;1:*.flv=00;38;5;1:*.gl=00;38;5;1:*.m2ts=00;38;5;1:*.divx=00;38;5;1:*.webm=00;38;5;1:*.axv=00;38;5;1:*.anx=00;38;5;1:*.ogv=00;38;5;1:*.ogx=00;38;5;1:';
export LS_COLORS
