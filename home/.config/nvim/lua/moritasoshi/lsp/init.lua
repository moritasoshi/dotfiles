local lspinstaller = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

lspinstaller.setup {
  ensure_installed = {
    "bashls",
    "jdtls",
    "jsonls",
    "sumneko_lua",
    "tsserver",
  },
  log_level = vim.log.levels.DEBUG,
}
require("moritasoshi.lsp.handlers").setup()

for _, server in ipairs(lspinstaller.get_installed_servers()) do
  local opts = {
    on_attach = require("moritasoshi.lsp.handlers").on_attach,
    capabilities = require("moritasoshi.lsp.handlers").capabilities,
  }

  if server.name == "bashls" then
    opts.cmd = { "nodebrew", "exec", "latest", "bash-language-server", "start" }
  end

  if server.name == "jdtls" then
    goto continue
  end

  if server.name == "jsonls" then
    local jsonls_opts = require("moritasoshi.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("moritasoshi.lsp.settings.sumneko_lua").setup(opts)
    opts = sumneko_opts
  end

  lspconfig[server.name].setup(opts)
  ::continue::
end

require("moritasoshi.lsp.null-ls")
