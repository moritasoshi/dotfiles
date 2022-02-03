# aliases

## ls
alias ls='ls -G'
alias la='ls -a'
alias ll='ls -alF'

## 1 letter aliases
alias f='find . -type f'
alias g='git'
alias t='date +%Y-%m-%d[%H:%M:%S]'

## replacements
alias calc='bc' # "last": Output the last result
alias date='gdate'
alias grep='grep --color=auto'
alias sed='gsed'
alias tree='tree -aI ".git|node_modules|.DS_Store"'
alias vim='nvim'

## edit dotfiles
alias cocsetting='vim ~/.config/nvim/coc-settings.json'
alias tmuxconf='vim ~/.tmux.conf'
alias vimrc='vim ~/.config/nvim/init.vim'
alias zshrc='vim ~/.zshrc'
alias zshalias='vim ~/.zsh/alias.zsh'
alias zshfunc='vim ~/.zsh/functions.zsh'

## reload dotfiles
alias sz='source ~/.zshrc'
alias st='tmux source ~/.tmux.conf'

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
