source ~/.config/fish/config/alias.fish
source ~/.config/fish/config/sdkman.fish
source ~/.config/fish/config/function.fish

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

function history-merge --on-event fish_preexec
    history --save
    history --merge
end

zoxide init fish --cmd z | source

if command -v mise &>/dev/null
    mise activate fish | source
end
