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
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").load()
    end,
  },
  -- Configure LazyVim to load nordic
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordic",
    },
  },
}
