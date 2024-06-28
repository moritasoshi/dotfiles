# download the tmp plugins manager
if [ ! -d ~/.tmux/plugins/tpm ]; then
  echo "install tpm"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
