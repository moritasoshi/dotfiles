-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = function(mode, keys, command, opt)
  local options = { noremap = true, silent = true }
  if opt then
    options = vim.tbl_extend("force", options, opt)
  end

  vim.keymap.set(mode, keys, command, opt)
end

map("n", "<leader>cp", ":%s/", { desc = "Replace text" })
map("n", "<S-CR>", "<cmd><C-u>call append(expand('.'), '')<CR>j")
map("", "go", "<C-O>")
map("x", "p", "pgvy")
map(
  "n",
  "ygf",
  "<cmd>let @* = expand('%:t') | lua print('Copied ' .. vim.fn.expand('%:t') .. ' to system clipboard!')<CR>",
  { desc = "Copy filename" }
)
map(
  "n",
  "ygp",
  "<cmd>let @* = expand('%') | lua print('Copied ' .. vim.fn.expand('%') .. ' to system clipboard!')<CR>",
  { desc = "Copy filename with path" }
)

-- terminal mode
vim.cmd([[
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k tnoremap <A-l> <C-\><C-N><C-w>l
]])
