## ls
alias l 'lsd -l'
alias la 'lsd -a'
alias ll 'lsd -la'
alias tree 'lsd -a --tree'

## 1 letter aliases
alias e "code-insiders -a ."
alias g 'git'

## replacements
alias awk 'gawk'
# alias calc "BC_ENV_ARGS=<(echo 'scale=8') bc"
alias date 'gdate'
alias dircolors 'gdircolors'
alias grep 'grep --color=auto'
alias zgrep 'zgrep --color=auto'
alias rg "rg --no-ignore --colors path:fg:yellow"
alias sed 'gsed'
alias ssh 'TERM=xterm-256color /usr/bin/ssh'
alias vim 'nvim'
alias vimdiff 'nvim -d'

## tmux
alias tm 'tmux'
alias tma 'tmux a'
alias tmn 'tmux new -s'

alias sf 'source $XDG_CONFIG_HOME/fish/config.fish'
alias dot 'cd ~/src/dotfiles/'
alias memo 'cd ~/memo'
alias path 'echo $PATH'
alias code 'open -na "Visual Studio Code.app" --args'
alias idea 'open -na "IntelliJ IDEA.app" --args'

# prompt
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_showupstream 'verbose'

function fish_prompt
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal
  echo -e (fish_git_prompt)
  echo -n '$ '
end

function moriso_repository -d 'Repository search'
  ls $HOME/src | fzf --reverse --height=100% | read select
  [ -n "$select" ]; and cd "$HOME/src/$select"
  echo " $select"
  commandline -f repaint
end

function moriso_history -d 'Command history search'
  history merge
  history | fzf --reverse --height=100% | read -lz result
  and commandline $result
  commandline -f repaint
end

function fish_user_key_bindings
  bind \cS moriso_repository
  bind \cR moriso_history
  bind --preset \cO echo\ -n\ \(clear\ \|\ string\ replace\ \\e\\\[3J\ \"\"\)\;\ commandline\ -f\ repaint
end

function history-merge --on-event fish_preexec
  history --save
  history --merge
end

zoxide init fish --cmd z | source
status --is-interactive; and rbenv init - fish | source
