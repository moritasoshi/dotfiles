## ls
alias l 'lsd -l'
alias la 'lsd -a'
alias ll 'lsd -la'
alias tree 'lsd -a --tree'

## 1 letter aliases
alias e "code-insiders -a ."
alias g git
alias v nvim
alias f flutter

## replacements
# alias calc "BC_ENV_ARGS=<(echo 'scale=8') bc"
alias grep 'grep --color=auto'
alias zgrep 'zgrep --color=auto'
alias rg "rg --no-ignore --colors path:fg:yellow"
alias ssh 'TERM=xterm-256color /usr/bin/ssh'
alias vim nvim
alias vimdiff 'nvim -d'
alias tf terraform

## tmux
alias tm tmux
alias tma 'tmux a'
alias tmn 'tmux new -s'

alias sf 'exec fish'
alias dot 'cd ~/src/dotfiles/'
alias memo 'cd ~/memo'
alias path 'echo $PATH'
alias code 'open -na "Visual Studio Code.app" --args'
alias idea 'open -na "IntelliJ IDEA.app" --args'

# alias only for mac
if test Darwin = (uname)
    alias awk gawk
    alias sed gsed
    alias date gdate
    alias dircolors gdircolors
else if cat /etc/*-release | grep Ubuntu &>/dev/null
    # for ubuntu
    alias fd fdfind
    alias bat batcat
    alias pbcopy 'xsel --clipboard --input'
end
