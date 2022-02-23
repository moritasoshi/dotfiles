
local keymap = require"moritasoshi.util.keymap"
local map, nmap, xmap = keymap.map, keymap.nmap, keymap.xmap

nmap { "<Space>//", ":%s/" }

nmap { "<C-e>", ":NvimTreeToggle<CR>" }
nmap { "<Leader>a", ":Alpha<CR>" }
nmap { "<Leader>g", ":Neogit<CR>" }
nmap { "<leader>xx", "<cmd>Trouble<cr>" }


nmap { "<Leader>w", ":w<CR>" }
nmap { "<Leader>s", ":so %<CR>" }
nmap { "O", ":<C-u>call append(expand('.'), '')<CR>j" }
nmap { "<ESC>", ":nohlsearch<CR><ESC>" }
map  { "-", "$" }
nmap { "cp", ":let @* = expand('%:p')<CR>" }

-- For <Leader>
map { "<Space>", "<NOP>" }

-- Decrement the number on the cursor
nmap { "<C-s>", "<C-x>" }
nmap { "<C-x>", "<NOP>" }

nmap { "ga", "<Plug>(EasyAlign)" }
xmap { "ga", "<Plug>(EasyAlign)" }

xmap { "p", "pgvy" }

