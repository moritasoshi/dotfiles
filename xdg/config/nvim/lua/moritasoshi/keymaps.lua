local map = moriso.map

map("n", "<Space>//", ":%s/")

map("n", "<C-t>", ":NvimTreeToggle<CR>")
map("n", "gt", ":NvimTreeFindFileToggle<CR>")
map("n", "<Leader>a", ":Alpha<CR>")
map("n", "<Leader>g", ":Neogit<CR>")
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
map("n", "<Leader>mm", ":PrevimOpen<CR>")
map("n", "<Leader>vv", ":SymbolsOutline<CR>")

map("n", "<Leader>w", ":w<CR>")
map("n", "<Leader>s", ":so % | lua print('Loaded \"' .. vim.fn.expand('%') .. '\"')<CR>")
map("n", "<S-CR>", ":<C-u>call append(expand('.'), '')<CR>j")
map("n", "<ESC>", ":nohlsearch<CR><ESC>")
map("", "-", "$")

map("n", "gy", ":let @* = expand('%:t') | lua print('Copied ' .. vim.fn.expand('%:t') .. ' to system clipboard!')<CR>")
map("n", "gyy", ":let @* = expand('%') | lua print('Copied ' .. vim.fn.expand('%') .. ' to system clipboard!')<CR>")

-- For <Leader>
map("", "<Space>", "<NOP>")

-- map ("n", "ga", "<Plug>(EasyAlign)" )
-- xmap { "ga", "<Plug>(EasyAlign)" }

map("x", "p", "pgvy")

-- Tabular
map({ "n", "x" }, "<leader>t", ":Tabularize /")

map("n", "<leader>rr", [[<cmd>lua require('moritasoshi.config.rest-nvim').do_rest()<cr>]])
map("n", "<leader>rp", [[<cmd>lua require('moritasoshi.config.rest-nvim').view_rest()<cr>]])

-- -- 「かな」のままでいたい
-- map ("n", "あ", "a" )
-- map ("n", "い", "i" )
-- map ("n", "お", "o" )

-- xで削除した時はヤンクしない
-- map({ "n", "v" }, "x", [["_x]])

-- simeji/winresizer
map("", "<LEFT>", ":WinResizerStartResize<CR>h<CR>")
map("", "<DOWN>", ":WinResizerStartResize<CR>j<CR>")
map("", "<UP>", ":WinResizerStartResize<CR>k<CR>")
map("", "<RIGHT>", ":WinResizerStartResize<CR>l<CR>")

-- Diffview
map("", "<Leader>dc", ":DiffviewClose<CR>")
map("", "<Leader>dh", ":DiffviewFileHistory<CR>")

-- vim.api.nvim_set_keymap('n', '*', [[<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>]], {})
-- vim.api.nvim_set_keymap('n', '#', [[<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>]], {})
-- vim.api.nvim_set_keymap('n', 'g*', [[<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>]], {})
-- vim.api.nvim_set_keymap('n', 'g#', [[<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>]], {})
--
-- vim.api.nvim_set_keymap('x', '*', [[<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>]], {})
-- vim.api.nvim_set_keymap('x', '#', [[<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>]], {})
-- vim.api.nvim_set_keymap('x', 'g*', [[<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>]], {})
-- vim.api.nvim_set_keymap('x', 'g#', [[<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>]], {})

-- terminal mode
vim.cmd([[
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k tnoremap <A-l> <C-\><C-N><C-w>l
]])

-- spell check
map("n", "<F3>", ":set spell!<CR>")
map("i", "<F3>", "<C-O>:set spell!<CR>")
