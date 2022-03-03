local M = {}

local keymap = function (mode, lhs, rhs, opts)
  local options = opts or { noremap = true, silent = true }
  vim.keymap.set(mode, lhs, rhs, options)
end

M.keymap = function(tbl)
  keymap(tbl[1], tbl[2], tbl[3], tbl[4])
end

M.map = function(tbl)
  keymap("", tbl[1], tbl[2], tbl[3])
end

M.nmap = function(tbl)
  keymap("n", tbl[1], tbl[2], tbl[3])
end

M.imap = function(tbl)
  keymap("i", tbl[1], tbl[2], tbl[3])
end

M.xmap = function(tbl)
  keymap("x", tbl[1], tbl[2], tbl[3])
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
