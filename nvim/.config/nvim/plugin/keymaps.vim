""" Keymap settings -------------------------
" mouse wheel to scroll a window by the following mappings:
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
nnoremap <silent> <Space>// :%s/
nnoremap <silent><C-e> :NvimTreeToggle<CR>

noremap <leader>a :Alpha<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>s :So<CR>
nnoremap <Space> <NOP>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j
nnoremap <Esc> :nohlsearch<CR><ESC>
noremap - $
nmap cp :let @* = expand('%:p')<CR>
xnoremap p pgvy

" decrement the number on the cursor
noremap <C-s> <C-x>
nnoremap <C-x> <NOP>



