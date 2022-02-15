""" Install vim-plug  -----------------------
"if empty(glob("${XDG_DATA_HOME:-$HOME/.local/share}"))
"  silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif


lua vim.g.mapleader = " "

if has("nvim")
  set inccommand=nosplit
  set termguicolors
endif

lua require("moritasoshi.disable_builtin")

" load plugins
source ~/.config/nvim/plugins.vim

lua pcall(require, "impatient")

lua require("moritasoshi.lsp")
lua require("moritasoshi.telescope")

lua require("mkdir")
lua require("colorizer").setup()


let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0

""" bullets.vim -------------------------
let g:bullets_outline_levels           = ['std-']
let g:bullets_checkbox_markers         = ' x'
let g:bullets_nested_checkboxes        = 1
let g:bullets_checkbox_partials_toggle = 1

""" motion -------------------------
let g:comfortable_motion_no_default_key_mappings = 0
let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.

""" NERDTree -------------------------
let NERDTreeIgnore=['\.git$', '\.idea$', '\.vscode$', '\.history$', '\.DS_Store$']

""" Commands -------------------------
" 全角数字を半角に変換する
command! -nargs=0 Hankaku   :%s/０/0/ge|%s/１/1/ge|%s/２/2/ge|%s/３/3/ge|%s/４/4/ge|%s/５/5/ge|%s/６/6/ge|%s/７/7/ge|%s/８/8/ge|%s/９/9/ge
command! -nargs=0 ToCamel   :s#_\(\l\)#\u\1#g
command! -nargs=0 ToUpCamel :1,$s/_\([a-z]\)/\u\1/g
command! -nargs=0 ToSnake   :%s#\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#g
command! -nargs=0 So        :so ~/.config/nvim/init.vim

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" 編集箇所のカーソルを記憶
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

