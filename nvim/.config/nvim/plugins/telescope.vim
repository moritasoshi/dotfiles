lua << END
local actions = require('telescope.actions')
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
            ".git",
            "node_modules"
        },
        prompt_prefix = "🔎 ",
        borderchars = {
          prompt  = { "-", "|", "-", "|", "|", "|", "|", "|" },
          results = { "-", "|", "-", "|", "|", "|", "|", "|" },
          preview = { "-", "|", "-", "|", "|", "|", "|", "|" }
        },
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
END


nnoremap <leader>ff <cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
