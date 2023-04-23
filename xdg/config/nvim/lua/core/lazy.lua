local M = {}

-- bootstrap lazy.nvim
M.bootstrap = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  if not vim.loop.fs_stat(lazypath) then
    print("Installing lazy.nvim..")
    vim.fn.system {
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    }
    print("Congratulations! lazy.nvim has been successfully installed.")
  end
  vim.opt.rtp:prepend(lazypath)
end

M.run = function(plugins)
  require("lazy").setup(plugins)
end

return M
