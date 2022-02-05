""" Install vim-plug  -----------------------
"if empty(glob("${XDG_DATA_HOME:-$HOME/.local/share}"))
"  silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif





""" Plugins  --------------------------------
call plug#begin('~/.local/share/nvim/plugged')
  Plug 'dkarter/bullets.vim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'cohama/lexima.vim'
  Plug 'preservim/nerdtree'
  Plug 'tpope/vim-commentary'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'terryma/vim-expand-region'

  Plug 'nvim-treesitter/nvim-treesitter'

" tmux
  Plug 'christoomey/vim-tmux-navigator'

" Git
  Plug 'airblade/vim-gitgutter'

" LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'mfussenegger/nvim-jdtls'

" Telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

" HTTP Client
  Plug 'NTBBloodbath/rest.nvim'

" Theme
  Plug 'doums/darcula'
  Plug 'morhetz/gruvbox'


call plug#end()




""" Source Vim scripts ------------------
source ~/.config/nvim/config.vim

source ~/.config/nvim/plugin/rest-nvim.vim
source ~/.config/nvim/plugin/telescope.vim
source ~/.config/nvim/plugin/nvim-treesitter.vim




""" bullets.vim -------------------------
let g:bullets_outline_levels = ['std-']
let g:bullets_checkbox_markers = ' x'
let g:bullets_nested_checkboxes = 1
let g:bullets_checkbox_partials_toggle = 1

""" ctrlP -------------------------
let g:ctrlp_show_hidden = 1
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

""" NERDTree -------------------------
let NERDTreeIgnore=['\.git$', '\.idea$', '\.vscode$', '\.history$', '\.DS_Store$']


""" Commands -------------------------
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" 全角数字を半角に変換する
command! -nargs=0 Hankaku :%s/０/0/ge|%s/１/1/ge|%s/２/2/ge|%s/３/3/ge|%s/４/4/ge|%s/５/5/ge|%s/６/6/ge|%s/７/7/ge|%s/８/8/ge|%s/９/9/ge
command! -nargs=0 Sneakcamel :%s/\v_(.)/\u\1/g
command! -nargs=0 So :so ~/.config/nvim/init.vim

""" Keymap settings -------------------------
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>
" 空行挿入
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j
" Escのでハイライト消去
nnoremap <Esc> :nohlsearch<CR><ESC>
" The end of the line.
noremap - $
" decrement the number on the cursor
noremap <C-s> <C-x>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>s :So<CR>

map J <Plug>(expand_region_expand)
map K <Plug>(expand_region_shrink)

" re-yank text that is pasted in visual mode
xnoremap p pgvy

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
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


