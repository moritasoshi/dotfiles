-- moritasoshi.telescope.lua
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
require('telescope').setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--ignore',
            '--hidden'
        },
        file_ignore_patterns = {
            ".git/",
            "node_modules/"
        },
        prompt_prefix = " 🔎 ",
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<esc>"] = actions.close
            }
        },
        color_devicons = true
    },
    pickers = {
        lsp_code_actions = {
            theme = "cursor"
        },
        lsp_workspace_diagnostics = {
            theme = "dropdown"
        }
    }
}

vim.api.nvim_set_keymap("n", "<C-p>", [[<CMD>lua require('moritasoshi.telescope').project_files()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>ff", [[<CMD>Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fg", [[<CMD>Telescope live_grep<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fb", [[<CMD>Telescope buffers<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fh", [[<CMD>Telescope help_tags<CR>]], {noremap = true, silent = true})

local M = {}
M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(builtin.git_files, opts)
  if not ok then builtin.find_files(opts) end
end
return M

-- call via:
-- :lua require"moritasoshi.telescope".project_files()

-- example keymap:
-- vim.api.nvim_set_keymap("n", "<Leader><Space>", "<CMD>lua require'telescope-config'.project_files()<CR>", {noremap = true, silent = true})
