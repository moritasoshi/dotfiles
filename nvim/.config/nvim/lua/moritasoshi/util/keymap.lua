local M = {}

local default_options = { noremap = true, silent = true }
local map = function (mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

M.nmap = function(tbl)
  local opts = tbl[3] or default_options
  map("n", tbl[1], tbl[2], opts)
end

M.imap = function(tbl)
  local opts = tbl[3] or default_options
  map("i", tbl[1], tbl[2], opts)
end

M.xmap = function(tbl)
  local opts = tbl[3] or default_options
  map("x", tbl[1], tbl[2], opts)
end


-- local set_options = function (opts)
--     opts = opts or {}
--
--     for opt, _ in pairs(opts) do
--         if (config.options[opt] ~= nil) then -- not nil
--           config.options[opt] = opts[opt]
--         end
--     end
-- end


return M
