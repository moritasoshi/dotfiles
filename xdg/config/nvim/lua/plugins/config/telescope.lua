-- plugins.telescope.lua
local present, telescope = pcall(require, "telescope")
if not present then
  return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
telescope.setup {
  defaults = {
    prompt_prefix = " 🔭 ",
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<esc>"] = actions.close,
      },
    },
    color_devicons = true,
  },
}

local map = moriso.map

map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>")
map("n", "<leader>ff", "<cmd>lua require('plugins.config.telescope').project_files()<cr>")
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').builtin()<cr>")

local M = {}
M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(builtin.git_files, opts)
  if not ok then
    builtin.find_files(opts)
  end
end
return M
