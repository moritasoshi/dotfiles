_G.moriso = {}

-- load plugin after entering vim ui
moriso.packer_lazy_load = function(plugin, timer)
  if plugin then
    timer = timer or 0
    vim.defer_fn(function()
      require("packer").loader(plugin)
    end, timer)
  end
end

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

-- Convert table structure
moriso.convert_plugin_structure = function(default_plugins)
  local final_table = {}

  for key, _ in pairs(default_plugins) do
    default_plugins[key][1] = key

    final_table[#final_table + 1] = default_plugins[key]
  end

  return final_table
end
