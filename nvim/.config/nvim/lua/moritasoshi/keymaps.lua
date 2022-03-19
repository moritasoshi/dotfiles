local k = require("moritasoshi.util.keymap")

k.nmap { "<Space>//", ":%s/" }

k.nmap { "<C-t>", ":NvimTreeToggle<CR>" }
k.nmap { "<Leader>a", ":Alpha<CR>" }
k.nmap { "<Leader>g", ":Neogit<CR>" }
k.nmap { "<leader>xx", "<cmd>TroubleToggle<cr>" }

k.nmap { "<Leader>w", ":w<CR>" }
k.nmap { "<Leader>s", ":so % | lua print('Loaded \"' .. vim.fn.expand('%') .. '\"')<CR>" }
k.nmap { "O", ":<C-u>call append(expand('.'), '')<CR>j" }
k.nmap { "<ESC>", ":nohlsearch<CR><ESC>" }
k.map { "", "-", "$" }
k.nmap { "gy", ":let @* = expand('%') | lua print('Copied ' .. vim.fn.expand('%') .. ' to system clipboard!')<CR>" }
k.nmap {
  "gyy",
  ":let @* = expand('%:p') | lua print('Copied ' .. vim.fn.expand('%:p') .. ' to system clipboard!')<CR>",
}

-- For <Leader>
k.map { "", "<Space>", "<NOP>" }

-- Decrement the number on the cursor
k.nmap { "<C-s>", "<C-x>" }
k.nmap { "<C-x>", "<NOP>" }

-- nmap { "ga", "<Plug>(EasyAlign)" }
-- xmap { "ga", "<Plug>(EasyAlign)" }

k.xmap { "p", "pgvy" }

-- Tabular
k.map { { "n", "x" }, "<leader>t", ":Tab /" }

k.nmap { "<leader>rr", [[<cmd>lua require('moritasoshi.config.rest-nvim').do_rest()<cr>]] }
k.nmap { "<leader>rp", [[<cmd>lua require('moritasoshi.config.rest-nvim').view_rest()<cr>]] }

-- -- 「かな」のままでいたい
-- k.nmap { "あ", "a" }
-- k.nmap { "い", "i" }
-- k.nmap { "お", "o" }

-- xで削除した時はヤンクしない
k.map { { "n", "v" }, "x", [["_x]] }

-- simeji/winresizer
k.map { "", "<LEFT>" , ":WinResizerStartResize<CR>h<CR>" }
k.map { "", "<DOWN>" , ":WinResizerStartResize<CR>j<CR>" }
k.map { "", "<UP>"   , ":WinResizerStartResize<CR>k<CR>" }
k.map { "", "<RIGHT>", ":WinResizerStartResize<CR>l<CR>" }
