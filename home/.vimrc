""" Install vim-plug  -----------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""" Plugins  --------------------------------
call plug#begin('~/.vim/plugged')
	Plug 'doums/darcula'
	Plug 'preservim/nerdtree'
call plug#end()

""" Common settings -------------------------
set clipboard+=unnamed
set number

syntax enable
colorscheme darcula

""" Keymap settings -------------------------
nnoremap <silent><C-e> :NERDTreeToggle<CR>

