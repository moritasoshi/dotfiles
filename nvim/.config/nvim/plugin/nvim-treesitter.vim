lua << END
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {}
  },
  ensure_installed = { "http", "json" }
}
END
