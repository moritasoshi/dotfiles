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
alias ssh 'TERM=xterm-256color ssh'
alias vim 'nvim'
alias vimdiff 'nvim -d'

## tmux
alias tm 'tmux'
alias tma 'tmux a'
alias tmn 'tmux new -s'

alias dot 'cd ~/src/dotfiles/'
alias memo 'cd ~/memo'
alias path 'echo $PATH'
alias code 'open -na "Visual Studio Code.app" --args'
alias idea 'open -na "IntelliJ IDEA.app" --args'

# prompt
set -g __fish_git_prompt_showcolorhints 'yes'
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_showupstream 'verbose'

function fish_prompt
  echo
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal
  echo -e (fish_git_prompt)
  echo -n '$ '
end

function morita
  set -l repo (ls $HOME/src | fzf)
  cd $HOME/src/$repo
end

function fish_user_key_bindings
  bind \cS morita
end

function history-merge --on-event fish_preexec
  history --save
  history --merge
end

zoxide init fish --cmd j | source
