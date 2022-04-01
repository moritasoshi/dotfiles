#!/bin/bash
#
########################################
#
# https://rsapkf.xyz/weblog/enabling-italics-vim-tmux
# https://www.pandanoir.info/entry/2019/11/02/202146
#
########################################

download() {
  curl -L https://gist.githubusercontent.com/sos4nt/3187620/raw/bca247b4f86da6be4f60a69b9b380a11de804d1e/xterm-256color-italic.terminfo -o /tmp/xterm-256color-italic.terminfo
  echo "Downloaded file to /tmp/xterm-256color-italic.terminfo"
}

apply() {
  tic /tmp/xterm-256color-italic.terminfo
  echo "Created terminfo file"
}

ensure_not_degraded() {
  printf ":::TRUE COLOR\n"
  curl -s https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh | bash
  printf "\n:::ITALIC\n\e[3m This line should be italic. \e[23m\n"
}

usage() {
  cat <<EOF
:usage

if [[ $1 = "deploy" ]]; then
  download
  apply
  return
elif [[ $1 = "check" ]]; then
  ensure_not_degraded
  return
fi
EOF
}

if [[ $1 = "deploy" ]]; then
  download
  apply
elif [[ $1 = "check" ]]; then
  ensure_not_degraded
else
  usage && exit 1
fi
