local present, impatient = pcall(require, "impatient")

if present then
  impatient.enable_profile()
end

require("core")
require("core.utils")
require("core.options")
require("moritasoshi.commands")
require("moritasoshi.keymaps")

require("core.packer").bootstrap()
-- require("moritasoshi.plugins")
require("plugins")

-- Set up LSP
vim.lsp.set_log_level("debug")
-- require("moritasoshi.lsp")
