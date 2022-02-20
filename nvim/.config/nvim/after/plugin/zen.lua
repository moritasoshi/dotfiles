require("zen-mode").setup {
  window = {
    backdrop = 0.999,
    height = 0.9,
    width = 140,
    options = {
      number = false,
      relativenumber = false,
    },
    plugins = {
      gitsigns = false,
      twilight = true
    }
  },
}

require("twilight").setup {
  context = -1,
  treesitter = false,
}
