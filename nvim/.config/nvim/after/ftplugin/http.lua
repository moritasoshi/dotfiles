vim.opt_local.shiftwidth = 2

local ok, _ = pcall(require, "moritasoshi.config.rest-nvim")
if ok then
  vim.notify("rest-nvim is available", "info")
end
