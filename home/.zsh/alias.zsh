alias l='ls -F'
alias la='ls -a'
alias ll='ls -l'

alias f='find . -type f'
alias grep='grep --color=auto'
alias g='git'
alias date='gdate'
alias sed='gsed'
alias calc='bc'

alias vim='nvim'

alias sz='source ~/.zshrc'
alias st='tmux source ~/.tmux.conf'
alias git-push-release='git checkout develop && git push && git checkout master && git push && git push --tags'

alias path='echo $PATH'

alias idea='open -na "IntelliJ IDEA.app" --args "$@"'
alias code='open -na "Visual Studio Code.app" --args "$@"'
alias subl='(){/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl $1}'

# Global aliases
alias -g G='| grep'
alias -g X='| xargs'
alias -g XG='| xargs'
