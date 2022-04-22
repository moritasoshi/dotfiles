local M = {}

-- usage: register_contents("%"|"0"...)
M.get_register_content = function(register_name)
  return vim.api.nvim_call_function("getreg", { register_name, 1 })
end

return M
