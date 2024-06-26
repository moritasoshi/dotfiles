source ~/.config/fish/alias.fish

# prompt
set -g __fish_git_prompt_showdirtystate yes
set -g __fish_git_prompt_showupstream verbose

function fish_prompt
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal
    echo -e (fish_git_prompt)
    echo -n '$ '
end

function s -d 'Show repository'
    ls $HOME/src | fzf --reverse --height=100% | read select
    [ -n "$select" ]; and cd "$HOME/src/$select"
    echo " $select"
    commandline -f repaint
end

function moriso_history -d 'Show command history'
    test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
    begin
        set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT $FZF_DEFAULT_OPTS --tiebreak=index --bind=ctrl-r:toggle-sort,ctrl-z:ignore $FZF_CTRL_R_OPTS +m"
        set -l FISH_MAJOR (echo $version | cut -f1 -d.)
        set -l FISH_MINOR (echo $version | cut -f2 -d.)

        # history's -z flag is needed for multi-line support.
        # history's -z flag was added in fish 2.4.0, so don't use it for versions
        # before 2.4.0.
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
    # bind \cS s
    bind \cR moriso_history
    bind \cS s
    # bind --preset \cO echo\ -n\ \(clear\ \|\ string\ replace\ \\e\\\[3J\ \"\"\)\;\ commandline\ -f\ repaint
end

function history-merge --on-event fish_preexec
    history --save
    history --merge
end

zoxide init fish --cmd z | source
mise activate fish | source
# remove unused aws env
set -e AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
#source "$XDG_DATA_HOME/cargo/env.fish"
