vim.opt.termguicolors = true

-- For dark version
vim.opt.background = "dark"

vim.g.gruvbox_material_palette = "mix" -- material, mix, original
vim.g.gruvbox_material_background = "hard" -- soft. medium, hard
vim.g.gruvbox_material_enable_italic = 1
vim.cmd([[colorscheme gruvbox-material]])
vim.cmd([[highlight CursorLine guibg=#393939]])
