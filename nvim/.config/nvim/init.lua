
vim.g.mapleader = " "
vim.opt.termguicolors = true

-- For better development
require("impatient")

-- Disale unusing features
require("moritasoshi.disable_builtin")
require("moritasoshi.globals")

-- Load plugins
require('moritasoshi.plugins')

-- Set up LSP
require("moritasoshi.lsp")

-- Commands nd Keymaps
require("moritasoshi.commands")
require("moritasoshi.keymaps")
require("moritasoshi.options")
