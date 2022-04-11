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
    "dot",
    "go",
    "html",
    "http",
    "java",
    "javascript",
    "json",
    "json5",
    "jsonc",
    "lua",
    "make",
    "markdown",
    "python",
    "ruby",
    "scss",
    "tsx",
    "typescript",
    "vim",
  },
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  indent = { enable = true, disable = { "" } },
  incremental_selection = { enable = true },
}
