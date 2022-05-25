local present, rest = pcall(require, "rest-nvim")
if not present then
  return
end

rest.setup {
  -- Open request results in a horizontal split
  result_split_horizontal = false,
  -- Skip SSL verification, useful for unknown certificates
  skip_ssl_verification = false,
  -- Highlight request on run
  highlight = {
    enabled = true,
    timeout = 150,
  },
  -- Jump to request line on run
  jump_to_request = false,
}

-- functions
local M = {}
M.do_rest = function()
  require("rest-nvim").run()
  vim.cmd("redraw")
end
M.view_rest = function()
  require("rest-nvim").run(true)
  vim.cmd("redraw")
end
return M
