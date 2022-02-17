local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require('moritasoshi.lsp.handlers').setup()
require('moritasoshi.lsp.lsp-installer')
require("moritasoshi.lsp.null-ls")
