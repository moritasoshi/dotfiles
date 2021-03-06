local M = {}

-----------------------------
-- Setup
-----------------------------
M.setup = function()
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
  vim.g.diagnostic_enable_virtual_text = 1
  vim.g.diagnostic_virtual_text_prefix = " "
end

-----------------------------
-- Exports
-----------------------------

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD",         "<cmd>lua vim.lsp.buf.declaration()<CR>",                                opts)
  buf_set_keymap("n", "gd",         "<cmd>lua vim.lsp.buf.definition()<CR>",                                 opts)
  buf_set_keymap("n", "<C-g>",      "<cmd>lua vim.lsp.buf.definition()<CR>",                                 opts)
  buf_set_keymap("n", "K",          "<cmd>lua vim.lsp.buf.hover()<CR>",                                      opts)
  buf_set_keymap("n", "gi",         "<cmd>lua vim.lsp.buf.implementation()<CR>",                             opts)
  buf_set_keymap("n", "gk",         "<cmd>lua vim.lsp.buf.signature_help()<CR>",                             opts)
  buf_set_keymap("n", "<space>wa",  "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",                       opts)
  buf_set_keymap("n", "<space>wr",  "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",                    opts)
  buf_set_keymap("n", "<space>wl",  "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D",   "<cmd>lua vim.lsp.buf.type_definition()<CR>",                            opts)
  buf_set_keymap("n", "<space>rn",  "<cmd>lua vim.lsp.buf.rename()<CR>",                                     opts)
  buf_set_keymap("n", "<space>ca",  "<cmd>lua vim.lsp.buf.code_action()<CR>",                                opts)
  buf_set_keymap("n", "gr",         "<cmd>lua vim.lsp.buf.references()<CR>",                                 opts)
  buf_set_keymap("n", "<space>e",   "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",               opts)
  buf_set_keymap("n", "[d",         "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",                           opts)
  buf_set_keymap("n", "]d",         "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",                           opts)
  buf_set_keymap("n", "<space>q",   "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>",                         opts)
  buf_set_keymap("n", "<leader>l",  "<cmd>lua vim.lsp.buf.format{async=true}<CR>",                           opts)
  buf_set_keymap("v", "<leader>lr", "<cmd>lua vim.lsp.buf.range_formatting()<CR>",                           opts)

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      ]],
      false
    )
  end
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = capabilities

return M
