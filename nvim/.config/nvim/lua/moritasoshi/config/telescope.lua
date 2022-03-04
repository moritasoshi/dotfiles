-- moritasoshi.telescope.lua
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--ignore",
      "--ignore-case",
      "--hidden",
    },
    file_ignore_patterns = {
      ".git/",
      "node_modules/",
    },
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

  pickers = {
    lsp_code_actions = {
      theme = "cursor",
    },
    lsp_workspace_diagnostics = {
      theme = "dropdown",
    },
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
    },
  },
}

require("telescope").load_extension("fzf")

local nmap = require("moritasoshi.util.keymap").nmap
local builtin_prefix = [[<cmd>lua require("telescope.builtin").]]

nmap { "<C-p>", "<cmd>lua require('moritasoshi.config.telescope').project_files()<cr>" }
nmap { "<leader>ff", builtin_prefix .. "find_files()<cr>" }
nmap { "<leader>fg", builtin_prefix .. "live_grep()<cr>" }
nmap { "<leader>fb", builtin_prefix .. "buffers()<cr>" }
nmap { "<leader>fh", builtin_prefix .. "help_tags()<cr>" }

local M = {}
M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(builtin.git_files, opts)
  if not ok then
    builtin.find_files(opts)
  end
end
return M
