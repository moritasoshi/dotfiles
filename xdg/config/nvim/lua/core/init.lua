local autocmd = vim.api.nvim_create_autocmd

-- Disable auto-trim in Java
autocmd("FileType", {
  pattern = "java",
  callback = function()
    vim.cmd("DisableStripWhitespaceOnSave")
  end,
})

autocmd("BufUnload", {
  buffer = 0,
  callback = function()
    vim.opt.laststatus = 3
  end,
})

-- Make whitespaces invisible in dashboard
autocmd("BufRead", {
  callback = function()
    local ft = vim.bo.filetype
    if ft == "alpha" then
      vim.opt.listchars = ""
    else
      vim.opt.listchars = moriso.opt.listchars
    end
  end,
})

-- Make whitespaces invisible in dashboard
-- autocmd("BufWritePre", {
--   pattern = { "*.go" },
--   callback = function()
--     require("go.format").goimport()
--   end,
-- })

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "Substitute", timeout = 150, on_macro = true }
  end,
})
