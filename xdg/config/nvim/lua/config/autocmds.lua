-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable auto-trim in Java
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*.java",
  callback = function()
    vim.cmd("DisableStripWhitespaceOnSave")
  end,
})

-- Original vim command
vim.cmd([[
" quit all
command! -nargs=0 Q         :wqa
command! -nargs=0 QQ        :qa!

" git blame
command! -nargs=0 Gblame    :Gitsigns toggle_current_line_blame
]])
