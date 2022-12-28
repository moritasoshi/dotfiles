require("moritasoshi.lsp.handlers").setup()
require("mason").setup {
  ui = {
    icons = {
      package_installed = "✓",
    },
  },
}
require("mason-lspconfig").setup {
  ensure_installed = {
    "bashls",
    "jsonls",
    "sumneko_lua",
    "tsserver",
  },
}

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    local opts = {
      on_attach = require("moritasoshi.lsp.handlers").on_attach,
      capabilities = require("moritasoshi.lsp.handlers").capabilities,
    }

    if server_name == "sumneko_lua" then
      require("neodev").setup()
      opts = {}
    end
    if server_name == "jsonls" then
      local jsonls_opts = require("moritasoshi.lsp.settings.jsonls")
      opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end
    if server_name == "bashls" then
      opts.cmd = { "nodebrew", "exec", "latest", "bash-language-server", "start" }
    end
    if server_name == "tsserver" then
      opts.cmd = { "nodebrew", "exec", "latest", "typescript-language-server", "--stdio" }
    end
    require("lspconfig")[server_name].setup(opts)
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  ["rust_analyzer"] = function()
    require("rust-tools").setup {}
  end,
}
