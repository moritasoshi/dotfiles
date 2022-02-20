
local keymap = require("moritasoshi.util.keymap")
local nmap, xmap = keymap.nmap, keymap.xmap

nmap({ "<Space>//", ":%s/" })
nmap({ "<C-e>", ":NvimTreeToggle<CR>"})
nmap({ "<Leader>a", ":Alpha" })
nmap({ "<Leader>w", ":w" })
nmap({ "<Leader>s", ":So" })
nmap({ "O", ":<C-u>call append(expand('.'), '')<Cr>j" })
nmap({ "<ESC>", ":nohlsearch<CR><ESC>" })
nmap({ "-", "$" })
nmap({ "cp", ":let @* = expand('%:p')<CR>" })

-- For <Leader>
nmap({ "<Space>", "<NOP>" })

-- Decrement the number on the cursor
nmap({ "<C-s>", "<C-x>" })
nmap({ "<C-x>", "<NOP>" })

nmap({ "ga", "<Plug>(EasyAlign)" })
xmap({ "ga", "<Plug>(EasyAlign)" })

xmap({ "p", "pgvy" })

