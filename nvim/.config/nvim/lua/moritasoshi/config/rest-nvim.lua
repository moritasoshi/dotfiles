require("rest-nvim").setup({
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
})


-- keymaps
local map = vim.api.nvim_buf_set_keymap
local opts = {silent = true, noremap = true}
map(0, "n", "rr", [[<cmd>lua require('moritasoshi.config.rest-nvim').do_rest()<cr>]], opts)
map(0, "n", "rp", [[<cmd>lua require('moritasoshi.config.rest-nvim').view_rest()<cr>]], opts)


-- functions
local M = {}
M.do_rest = function ()
  require "rest-nvim".run()
  vim.cmd('redraw')
end
M.view_rest = function ()
  require "rest-nvim".run(true)
  vim.cmd('redraw')
end
return M
