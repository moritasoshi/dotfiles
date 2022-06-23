local status_ok, go = pcall(require, "go")
if not status_ok then
  return
end

local ok, path = pcall(require, "nvim-lsp-installer.core.path")
if not ok then
  return
end

local gopls_path = path.concat { vim.fn.stdpath("data"), "lsp_servers", "gopls" }

local bootstrapped = function(path)
  local fn = vim.fn
  if fn.empty(fn.glob(path)) > 0 then
    return false
  end
  return true
end

if not bootstrapped(gopls_path) then
  return
end

go.setup {
  comment_placeholder = "   ",
  dap_debug = true,
  dap_debug_gui = true,
  fillstruct = "gopls",
  gofmt = "gopls", -- if set to gopls will use golsp format
  goimport = "gopls", -- if set to 'gopls' will use golsp format
  gopls_cmd = { gopls_path .. "/gopls" },
  lsp_cfg = true, -- false: use your own lspconfig
  lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = true, -- use on_attach from go.nvim
  max_line_len = 120,
  tag_transform = false,
  test_dir = "",
}
