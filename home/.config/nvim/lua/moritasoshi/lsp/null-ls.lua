local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

local sources = {
  null_ls.builtins.formatting.prettier.with {
    extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
  },
  null_ls.builtins.formatting.stylua.with {
    extra_args = { "--config-path", vim.fn.expand("~/.config/nvim/stylua.toml") },
  },
  null_ls.builtins.formatting.shfmt.with {
    extra_args = { "-i", "2", "-ci" },
  },
  null_ls.builtins.formatting.shellharden,
  -- null_ls.builtins.diagnostics.eslint,
  -- null_ls.builtins.completion.spell,
  -- null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
}

null_ls.setup {
  debug = false,
  diagnostics_format = "[#{c}] #{m} (#{s})",
  sources = sources,
  on_attach = require("moritasoshi.lsp.handlers").on_attach,
}
