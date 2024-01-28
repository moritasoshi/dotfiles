return {
  -- {
  --   "shaunsingh/nord.nvim",
  --   lazy = true,
  --   config = function()
  --     vim.cmd([[colorscheme nord]])
  --     require("nord").set()
  -- Room for improvement. hl for neogit.
  -- vim.api.nvim_set_hl(0, "NeogitDiffDelete", { link = "DiffDelete" })
  -- vim.api.nvim_set_hl(0, "NeogitDiffAdd", { link = "DiffAdd" })
  --   end,
  -- },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.opt.background = "dark" -- dark/light
      vim.g.gruvbox_material_foreground = "mix" -- material/mix/original
      vim.g.gruvbox_material_background = "hard" -- soft/medium/hard
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_better_performance = 1 -- reducing loading time
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  -- Configure LazyVim to load gruvbox-material
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "gruvbox-material" },
  },
  -- Configure lualine to load gruvbox-material
  {
    "nvim-lualine/lualine.nvim",
    opts = { options = { theme = "gruvbox-material" } },
  },
}
