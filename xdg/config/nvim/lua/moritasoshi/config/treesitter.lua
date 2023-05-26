local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
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
  -- sync_install = false,
  -- ignore_install = { "" },
  autotag = { enable = true },
  highlight = { enable = true },
  indent = { enable = true, disable = { "" } },
  incremental_selection = { enable = true },
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
}
