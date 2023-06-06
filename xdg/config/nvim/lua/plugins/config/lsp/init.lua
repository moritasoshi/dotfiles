require("plugins.config.lsp.handlers").setup()

local present, mason = pcall(require, "mason")
if not present then
  return
end

mason.setup {
  ui = {
    icons = {
      package_installed = "✓",
    },
  },
}
require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",
  },
}

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    local opts = {
      on_attach = require("plugins.config.lsp.handlers").on_attach,
      capabilities = require("plugins.config.lsp.handlers").capabilities,
    }

    if server_name == "lua_ls" then
      require("neodev").setup()
      opts = {}
    end
    if server_name == "jsonls" then -- json-lsp
      local jsonls_opts = require("plugins.config.lsp.settings.jsonls")
      opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    require("lspconfig")[server_name].setup(opts)
  end,

  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  ["rust_analyzer"] = function()
    require("rust-tools").setup {}
  end,
}
