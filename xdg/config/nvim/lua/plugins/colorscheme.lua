return {
  {
    "shaunsingh/nord.nvim",
    lazy = true,
    config = function()
      vim.cmd([[colorscheme nord]])
      require("nord").set()
    end,
  },
  -- Configure LazyVim to load nord
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}
