local autocmd = vim.api.nvim_create_autocmd

-- Disable statusline in dashboard
autocmd("FileType", {
  pattern = "alpha",
  callback = function()
    vim.opt.laststatus = 0
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

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "Substitute", timeout = 150, on_macro = true }
  end,
})
