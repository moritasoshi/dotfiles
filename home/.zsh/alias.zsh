# aliases

## ls
alias l='lsd -l'
alias la='lsd -a'
alias ll='lsd -la'
alias lt='lsd --tree'

## 1 letter aliases
alias c='clear'
alias g='git'
alias t='date +%Y-%m-%d[%H:%M:%S]'

## replacements
alias awk='gawk'
alias calc='BC_ENV_ARGS=<(echo "scale=8") \bc'
alias date='gdate'
alias dircolors='gdircolors'
alias grep='grep --color=auto'
alias zgrep='zgrep --color=auto'
alias del="trash -i -r" # Do not confirm, remove directory, too
alias rg="rg --no-ignore --colors path:fg:yellow"
alias sed='gsed'
alias ssh='TERM=screen-256color ssh'
alias tree='lsd -a --tree'
alias vim='nvim'
alias vimdiff='nvim -d'

## tmux
alias tm='tmux'
alias tma='tmux a'
alias tmn='tmux new -s'

## edit dotfiles
alias tmuxconf='vim ~/.tmux.conf'
alias vimrc='vim ~/.config/nvim/init.vim'
alias zshrc='vim ~/.zshrc'
alias zshalias='vim ~/.zsh/alias.zsh'
alias zshfunc='vim ~/.zsh/functions.zsh'

## reload dotfiles
alias sz='source ~/.zshrc'
alias st='tmux source ~/.tmux.conf'

alias dot='cd ~/src/dotfiles/'
alias dotfiles='dot'

## ?
alias memo='cd ~/memo'

alias path='echo $PATH'

alias code='open -na "Visual Studio Code.app" --args'
alias idea='open -na "IntelliJ IDEA.app" --args'
alias subl='(){/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl $1}'

# Global aliases
alias -g C='| pbcopy'
alias -g G='| grep'
alias -g X='| xargs'
alias -g XG='| xargs grep'
