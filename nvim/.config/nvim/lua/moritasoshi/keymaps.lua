local keymap = require("moritasoshi.util.keymap")
local map, nmap, xmap = keymap.map, keymap.nmap, keymap.xmap

nmap { "<Space>//", ":%s/" }

nmap { "<C-e>", ":NvimTreeToggle<CR>" }
nmap { "<Leader>a", ":Alpha<CR>" }
nmap { "<Leader>g", ":Neogit<CR>" }
nmap { "<leader>xx", "<cmd>TroubleToggle<cr>" }

nmap { "<Leader>w", ":w<CR>" }
nmap { "<Leader>s", ":so % | lua print('Loaded \"' .. vim.fn.expand('%') .. '\"')<CR>" }
nmap { "O", ":<C-u>call append(expand('.'), '')<CR>j" }
nmap { "<ESC>", ":nohlsearch<CR><ESC>" }
map { "-", "$" }
nmap { "gy", ":let @* = expand('%') | lua print('Copied ' .. vim.fn.expand('%') .. ' to system clipboard!')<CR>" }
nmap { "gyy", ":let @* = expand('%:p') | lua print('Copied ' .. vim.fn.expand('%:p') .. ' to system clipboard!')<CR>" }

-- For <Leader>
map { "<Space>", "<NOP>" }

-- Decrement the number on the cursor
nmap { "<C-s>", "<C-x>" }
nmap { "<C-x>", "<NOP>" }

-- nmap { "ga", "<Plug>(EasyAlign)" }
-- xmap { "ga", "<Plug>(EasyAlign)" }

xmap { "p", "pgvy" }

-- Tabular
nmap { "<leader>t", ":Tab /" }
xmap { "<leader>t", ":Tab /" }

nmap { "<leader>rr", [[<cmd>lua require('moritasoshi.config.rest-nvim').do_rest()<cr>]] }
nmap { "<leader>rp", [[<cmd>lua require('moritasoshi.config.rest-nvim').view_rest()<cr>]] }

-- 「かな」のままでいたい
nmap { "あ", "a" }
nmap { "い", "i" }
nmap { "お", "o" }

-- xで削除した時はヤンクしない
keymap.keymap { { "n", "v" }, "x", [["_x]] }

-- インデント調整後に選択範囲を開放しない
keymap.keymap { "v", ">", ">gv" }
keymap.keymap { "v", "<", "<gv" }
