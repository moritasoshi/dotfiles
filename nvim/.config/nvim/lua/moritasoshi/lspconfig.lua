local lspconfig = require('lspconfig')


-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<C-g>', ':lua vim.lsp.buf.definition()<CR>', opts)

  -- formatting
  if client.name == 'tsserver' then
    client.resolved_capabilities.document_formatting = true
  end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


lspconfig.flow.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  capabilities = capabilities
}
-- lspconfig.jsonls.setup{ on_attach=on_attach_vim, capabilities = capabilities }


-- Disable diagnostic sign
local signs = {
	{ name = "DiagnosticSignError" },
	{ name = "DiagnosticSignWarn" },
	{ name = "DiagnosticSignHint" },
	{ name = "DiagnosticSignInfo" },
}
for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = "", numhl = "" })
end

--vim.lsp.set_log_level("trace")
