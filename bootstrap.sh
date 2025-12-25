#!/usr/bin/env bash

# Logging Setup
LOG_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/dotfiles"
LOG_FILE="$LOG_DIR/bootstrap-$(date +%Y%m%d-%H%M%S).log"

# Create log directory
if mkdir -p "$LOG_DIR" 2>/dev/null; then
  # Redirect all output to both terminal and log file
  exec > >(tee -a "$LOG_FILE") 2>&1

  # Log header
  echo "========================================"
  echo "Bootstrap Log Started: $(date -Iseconds)"
  echo "User: $(whoami)"
  echo "Hostname: $(hostname)"
  echo "OS: $(uname -srm)"
  echo "Command: $0 $*"
  echo "========================================"
  echo ""
else
  echo "WARNING: Could not create log directory, continuing without file logging" >&2
fi

# Logging helper function
log_script() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] Running: $*"
  "$@"
  local exit_code=$?
  if [ $exit_code -ne 0 ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: $* failed with exit code $exit_code" >&2
  fi
  return $exit_code
}

# Log footer on exit
log_footer() {
  local exit_code=$?
  echo ""
  echo "========================================"
  if [ $exit_code -eq 0 ]; then
    echo "Bootstrap Completed Successfully"
  else
    echo "Bootstrap Failed (exit code: $exit_code)"
  fi
  echo "Log saved to: $LOG_FILE"
  echo "Ended: $(date -Iseconds)"
  echo "========================================"
}
trap log_footer EXIT

doSync() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] === Starting Sync Phase ==="
  log_script ./script/apply/bin.sh
  log_script ./script/apply/xdg_config.sh
  log_script ./script/apply/xdg_data.sh
  log_script ./script/apply/alacritty.sh
  log_script ./script/apply/ghostty.sh
  if [ "$(uname)" = "Darwin" ]; then
    log_script ./script/apply/hammerspoon.sh
  fi
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] === Sync Phase Complete ==="
  echo ""
}

doInstall() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] === Starting Install Phase ==="
  if [ "$(uname)" = "Darwin" ]; then
    log_script ./script/brew.sh -i
    log_script ./script/install/font-mac.sh
  elif [ "$(uname)" = "Linux" ]; then
    log_script ./script/install/tools.sh

    log_script ./script/install/alacritty.sh
    log_script ./script/install/ghostty.sh
    log_script ./script/install/applications.sh
    log_script ./script/install/brave.sh
    log_script ./script/install/fish.sh
    log_script ./script/install/font.sh
    log_script ./script/install/im.sh
    log_script ./script/install/locale_ja.sh
    log_script ./script/install/mise.sh
    log_script ./script/install/nvim.sh
    log_script ./script/install/sdkman.sh
    log_script ./script/install/tmux.sh
    log_script ./script/install/duckdb.sh
  fi

  log_script ./script/tmux-italic.sh -i
  log_script ./script/post_install.sh

  echo "[$(date '+%Y-%m-%d %H:%M:%S')] === Install Phase Complete ==="
  echo ""
}

doHelp() {
  echo "Usage: $(basename "$0") [options]" >&2
  echo
  echo "   -s, --sync             Synchronize dotfiles to home directory"
  echo "   -i, --install          Install packages"
  echo
  exit 1
}

if [ $# -eq 0 ]; then
  doHelp
else
  for i in "$@"; do
    case $i in
    -s | --sync)
      doSync
      shift
      ;;
    -i | --install)
      doSync
      doInstall
      shift
      ;;
    *)
      doHelp
      ;;
    esac
  done
fi
