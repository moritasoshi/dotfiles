local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

vim.opt.list = true
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
  "alpha",
  "help",
  "neogitstatus",
  "NvimTree",
  "Trouble",
}
vim.g.indentLine_enabled = 1
vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_context_char = "▏"
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true

-- for darcula
vim.cmd([[highlight IndentBlanklineChar guifg=#383838 gui=nocombine]])

indent_blankline.setup {
  space_char_blankline = " ",
  show_current_context = true,
}
