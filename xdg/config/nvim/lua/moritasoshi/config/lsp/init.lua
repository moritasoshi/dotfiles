local present, lspinstaller = pcall(require, "nvim-lsp-installer")
if not present then
  return
end

local present_config, lspconfig = pcall(require, "lspconfig")
if not present_config then
  return
end

lspinstaller.setup {
  ensure_installed = {
    "bashls",
    "jdtls",
    "jsonls",
    "sumneko_lua",
    "tsserver",
  },
  -- log_level = vim.log.levels.DEBUG,
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
  if server.name == "tsserver" then
    opts.cmd = { "nodebrew", "exec", "latest", "typescript-language-server", "--stdio" }
  end

  if server.name == "jdtls" then
    goto continue
  end

  if server.name == "jsonls" then
    local jsonls_opts = require("moritasoshi.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "sumneko_lua" then
    require("neodev").setup()
    opts = {}
  end

  lspconfig[server.name].setup(opts)
  ::continue::
end

-- require("moritasoshi.lsp.null-ls")
