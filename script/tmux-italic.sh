#!/usr/bin/env bash
#
########################################
#
# https://rsapkf.xyz/weblog/enabling-italics-vim-tmux
# https://www.pandanoir.info/entry/2019/11/02/202146
#
########################################

info() {
  printf "\033[00;34m$@\033[0m\n"
}

doDownload() {
  info "Download"
  curl -L https://gist.githubusercontent.com/sos4nt/3187620/raw/bca247b4f86da6be4f60a69b9b380a11de804d1e/xterm-256color-italic.terminfo -o /tmp/xterm-256color-italic.terminfo
  echo "Downloaded file to /tmp/xterm-256color-italic.terminfo"
}

doApply() {
  info "Apply"
  tic /tmp/xterm-256color-italic.terminfo
}

doCheck() {
  info "TRUE COLOR"
  curl -s https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh | bash

  echo
  info "ITALIC"
  printf "\e[3m This line should be italic. \e[23m\n"
}

doHelp() {
  echo "Usage: $(basename "$0") [options]" >&2
  echo
  echo "   -i, --install        Install"
  echo "   -c, --check          Check color and font"
  echo
  exit 1
}

if [ $# -eq 0 ]; then
  doHelp
else
  for i in "$@"; do
    case $i in
      -i | --install)
        doDownload
        doApply
        shift
        ;;
      -c | --check)
        doCheck
        shift
        ;;
      *)
        doHelp
        shift
        ;;
    esac
  done
fi
