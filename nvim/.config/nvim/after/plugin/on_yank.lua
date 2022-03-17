-- Highlight yanked
vim.api.nvim_create_augroup("_MSLuaHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "Substitute", timeout = 150, on_macro = true }
  end,
  group = "_MSLuaHighlight",
})
