return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "comment",
        "css",
        "dockerfile",
        "dot",
        "fish",
        "go",
        "gomod",
        "gowork",
        "html",
        "http",
        "java",
        "javascript",
        "json",
        "json5",
        "jsonc",
        "kdl",
        "kotlin",
        "lua",
        "make",
        "markdown",
        "python",
        "ruby",
        "scss",
        "terraform",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
    },
  },
}
