*based on* https://www.reddit.com/r/vim/comments/24g8r8/italics_in_terminal_vim_and_tmux/

* Check if italic font is supported:
```
$ echo -e "\e[3mitalic\e[23m"
```
* Also check:
```
$ infocmp $TERM | grep sitm
        sgr0=\E(B\E[m, sitm=\E[3m, smacs=\E(0, smam=\E[?7h,
$ infocmp $TERM | grep ritm
        ri=\EM, rin=\E[%p1%dT, ritm=\E[23m, rmacs=\E(B,
```
If nothing is returned, then here is the step to enable it:
1. Create a the file *screen-256color.terminfo* with the following content:
```
# A screen-256color based TERMINFO that adds the escape sequences for italic.
#
# Install:
#
#   tic screen-256color.terminfo
#
# Usage:
#
#   export TERM=screen-256color
#
screen-256color|screen with 256 colors and italic,
        sitm=\E[3m, ritm=\E[23m,
        use=screen-256color,
```
2. Execute the command:
```
$ tic screen-256color.terminfo
```
3. Add the following lines to *.vimrc*:
```
set t_ZH=^[[3m
set t_ZR=^[[23m
```
**NOTE:** *^[* must be entered with *\<C-V\>\<Esc\>*
3. Add the following line to *.tmux.conf*:
```
set -g default-terminal "screen-256color"
```
**NOTE:** It the step 3 does not work, start tmux using the following command:
```
$ env TERM=screen-256color tmux
```
