vim.g.mapleader = " "
vim.opt.termguicolors = true

-- For better development
-- require("impatient").enable_profile()
pcall(require, "impatient")

if require("moritasoshi.first_load") then
  return
end

-- Disale unusing features
require("moritasoshi.disable_builtin")
require("moritasoshi.globals")

-- Load plugins
require("moritasoshi.plugins")

-- Cache the humungous packer_compiled.lua file with impatient.nvim
require("moritasoshi.packer_compiled")

-- Set up LSP
vim.lsp.set_log_level("debug")
require("moritasoshi.lsp")

-- Commands nd Keymaps
require("moritasoshi.commands")
require("moritasoshi.keymaps")
require("moritasoshi.options")
