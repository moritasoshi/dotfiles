try
  silent! call plug#load('vim-abolish')
catch
  finish
endtry

let g:abolish_save_file = expand('<sfile>')

if !exists(':Abolish')
  finish
endif

Abolish teh the
