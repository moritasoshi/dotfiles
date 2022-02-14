""" Install vim-plug  -----------------------
"if empty(glob("${XDG_DATA_HOME:-$HOME/.local/share}"))
"  silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif


if has("nvim")
  set inccommand=nosplit
endif

""" Plugins  --------------------------------
call plug#begin('~/.local/share/nvim/plugged')
  Plug 'dkarter/bullets.vim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'cohama/lexima.vim'
  Plug 'preservim/nerdtree'
  Plug 'tpope/vim-commentary'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-surround'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'tami5/lspsaga.nvim'
  Plug 'folke/lua-dev.nvim'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-speeddating'
  Plug 'junegunn/vim-easy-align'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'yuttie/comfortable-motion.vim'
  Plug 'sainnhe/gruvbox-material'
  Plug 'lewis6991/spellsitter.nvim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'jghauser/mkdir.nvim'
  Plug 'goolord/alpha-nvim'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Tmux
  Plug 'christoomey/vim-tmux-navigator'

" Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

" LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'nvim-lua/lsp-status.nvim'
  Plug 'mfussenegger/nvim-jdtls'

" Compe
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'rafamadriz/friendly-snippets'

" Telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

" HTTP Client
  Plug 'NTBBloodbath/rest.nvim'

" Markdown

" Theme
  Plug 'doums/darcula'
  Plug 'morhetz/gruvbox'


call plug#end()


source ~/.config/nvim/config.vim
lua require('moritasoshi')

" lua << EOF
" local nullls = require "null-ls"
" nullls.setup {
"   sources = {
"     nullls.builtins.formatting.prettier,
"   },
" }
" EOF


""" bullets.vim -------------------------
let g:bullets_outline_levels = ['std-']
let g:bullets_checkbox_markers = ' x'
let g:bullets_nested_checkboxes = 1
let g:bullets_checkbox_partials_toggle = 1

""" motion -------------------------
" To prevent the plugin from defining those default key mappings
let g:comfortable_motion_no_default_key_mappings = 0

" mouse wheel to scroll a window by the following mappings:
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

" Scrolling proportional to the window height, you may use settings such as these:
let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.

" let g:comfortable_motion_interval = 2400.0 / 60
" let g:comfortable_motion_friction = 100.0
" let g:comfortable_motion_air_drag = 3.0
" nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
" nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>
" nnoremap <silent> <C-f> :call comfortable_motion#flick(200)<CR>
" nnoremap <silent> <C-b> :call comfortable_motion#flick(-200)<CR>

" noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
" noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

""" NERDTree -------------------------
let NERDTreeIgnore=['\.git$', '\.idea$', '\.vscode$', '\.history$', '\.DS_Store$']

nnoremap <silent> <Space>// :%s/

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}

""" Commands -------------------------
" 全角数字を半角に変換する
command! -nargs=0 Hankaku :%s/０/0/ge|%s/１/1/ge|%s/２/2/ge|%s/３/3/ge|%s/４/4/ge|%s/５/5/ge|%s/６/6/ge|%s/７/7/ge|%s/８/8/ge|%s/９/9/ge

command! -nargs=0 ToCamel :s#_\(\l\)#\u\1#g
" command! -nargs=0 ToUpCamel :s#\(\%(\<\l\+\)\%(_\)\@=\)\|_\(\l\)#\u\1\2#g
command! -nargs=0 ToUpCamel :1,$s/_\([a-z]\)/\u\1/g
" command! -nargs=0 ToSnake :s#\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#g
command! -nargs=0 ToSnake :%s#\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#g

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

nnoremap <Leader>w :w<CR>
nnoremap <Leader>s :So<CR>

" for leader " "
nnoremap <Space> <NOP>
" decrement the number on the cursor
noremap <C-s> <C-x>
nnoremap <C-x> <NOP>

nmap cp :let @* = expand('%:p')<CR>

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

let rules = [
\ { 'filetype': ['typescript', 'typescriptreact'], 'char': '>', 'at': '\s([a-zA-Z, ]*\%#)',            'input': '<Left><C-o>f)<Right>a=> {}<Esc>',                 },
\ { 'filetype': ['typescript', 'typescriptreact'], 'char': '>', 'at': '\s([a-zA-Z]\+\%#)',             'input': '<Right> => {}<Left>',              'priority': 10 },
\ { 'filetype': ['typescript', 'typescriptreact'], 'char': '>', 'at': '[a-z]((.*\%#.*))',              'input': '<Left><C-o>f)a => {}<Esc>',                       },
\ { 'filetype': ['typescript', 'typescriptreact'], 'char': '>', 'at': '[a-z]([a-zA-Z]\+\%#)',          'input': ' => {}<Left>',                                    },
\ { 'filetype': ['typescript', 'typescriptreact'], 'char': '>', 'at': '(.*[a-zA-Z]\+<[a-zA-Z]\+>\%#)', 'input': '<Left><C-o>f)<Right>a=> {}<Left>',                },
\ ]
for rule in rules
  call lexima#add_rule(rule)
endfor

