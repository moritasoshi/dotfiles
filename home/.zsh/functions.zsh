### functions ###
# minify pdf
function pdfmin() {
  local cnt=0
  for i in $@; do
    gs -sDEVICE=pdfwrite \
      -dCompatibilityLevel=1.4 \
      -dPDFSETTINGS=/screen \
      -dNOPAUSE -dQUIET -dBATCH \
      -sOutputFile=${i%.*}.min.pdf ${i} &
    (((cnt += 1) % 4 == 0)) && wait
  done
  wait && return 0
}


# ファイルのfirst~lastの行抽出
function mid() {
       local first=$1
       local last=$2
       local in=$3
       awk -v first=${first} -v last=${last} 'FNR>first&&last>FNR {print}' ${in}
}

# measure shell load time
function timezsh() {
  for i in $(seq 1 10); do time $SHELL -i -c exit; done
}

# Find Files
f() {
  cmd="fd --type f --follow -uu"
  if [ "$#" -eq 0 ]; then
    eval $cmd
  else
    eval $cmd | grep "$1"
  fi
}


### keybind ###
# peco
ms-history-selection() {
  BUFFER=$(history -n 1 | tail -r | awk '!a[$0]++' | peco --query "$BUFFER")
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N ms-history-selection
bindkey '^R' ms-history-selection

ms-repository-selection() {
  local selected_dir=$(fd . ~/src/ --maxdepth 1 | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N ms-repository-selection
bindkey '^S' ms-repository-selection

# easiest way to connect remote servers
ms-ssh-host-selection() {
  local selected_host=$(cat ~/.ssh/config | grep -oE "^Host \w.*" | cut -d" " -f2 | peco --query "$LBUFFER")
  if [ -n "$selected_host" ]; then
    BUFFER="ssh ${selected_host}"
  fi
}
zle -N ms-ssh-host-selection
bindkey '^V' ms-ssh-host-selection

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z


