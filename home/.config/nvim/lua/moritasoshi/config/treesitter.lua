local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = {
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "tsx",
    "java",
    "vim",
    "lua",
    "http",
    "json",
    "json5",
    "jsonc",
    "markdown",
    "comment",
    "dot",
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
