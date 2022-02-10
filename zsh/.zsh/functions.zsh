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

f() {
  cmd="fd --type f --hidden --follow --exclude .git"
  if [ "$#" -eq 0 ]; then
    eval $cmd
  else
    eval $cmd | grep "$1"
  fi
}
