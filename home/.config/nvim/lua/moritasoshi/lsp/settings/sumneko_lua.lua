local M = {}
M.setup = function(opts) -- opts = {on_attach: on_attach, capabilities: capabilities}
  local on_attach = opts.on_attach
  local capabilities = opts.capabilities

  return require("lua-dev").setup {
    library = {
      plugins = true,
    },
    lspconfig = {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim", "hs" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
    },
  }
end

return M
