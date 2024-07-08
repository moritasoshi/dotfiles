function show_repository -d 'Show repository'
    ls $HOME/src | fzf --reverse --height=100% | read select
    [ -n "$select" ]; and cd "$HOME/src/$select"
    echo " $select"
    commandline -f repaint
end

function show_history -d 'Show command history'
    test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
    begin
        set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT $FZF_DEFAULT_OPTS --tiebreak=index --bind=ctrl-r:toggle-sort,ctrl-z:ignore $FZF_CTRL_R_OPTS +m"
        set -l FISH_MAJOR (echo $version | cut -f1 -d.)
        set -l FISH_MINOR (echo $version | cut -f2 -d.)

        history merge
        if [ "$FISH_MAJOR" -gt 2 -o \( "$FISH_MAJOR" -eq 2 -a "$FISH_MINOR" -ge 4 \) ]
            history -z | eval (__fzfcmd) --read0 --print0 -q '(commandline)' | read -lz result
            and commandline -- $result
        else
            history | eval (__fzfcmd) -q '(commandline)' | read -l result
            and commandline -- $result
        end
    end
    commandline -f repaint
end

function __fzfcmd
    test -n "$FZF_TMUX"; or set FZF_TMUX 1
    test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
    if [ -n "$FZF_TMUX_OPTS" ]
        echo "fzf-tmux $FZF_TMUX_OPTS -- "
    else if [ $FZF_TMUX -eq 1 ]
        echo "fzf-tmux -d$FZF_TMUX_HEIGHT -- "
    else
        echo fzf
    end
end

function fish_user_key_bindings
    bind \cR show_history
    bind \cS show_repository
end
