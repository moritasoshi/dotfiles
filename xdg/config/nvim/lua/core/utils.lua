_G.moriso = {}

-- keymap
moriso.map = function(mode, keys, command, opt)
  local options = { noremap = true, silent = true }
  if opt then
    options = vim.tbl_extend("force", options, opt)
  end

  if type(keys) == "table" then
    for _, keymap in ipairs(keys) do
      moriso.map(mode, keymap, command, opt)
    end
    return
  end

  vim.keymap.set(mode, keys, command, opt)
end
