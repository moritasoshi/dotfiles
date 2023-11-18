return {
  -- Text manipulation
  {
    "godlygeek/tabular",
    config = function()
      require("plugins.config.tabular")
    end,
    cmd = "Tabularize",
  },
  { "ntpeters/vim-better-whitespace", event = { "InsertLeave", "TextChanged" } },
  {
    "abecodes/tabout.nvim",
    config = function()
      require("plugins.config.tabout")
    end,
  },

  -- UI & Interface
  "simeji/winresizer",

  -- HTTP Client
  {
    "NTBBloodbath/rest.nvim",
    config = function()
      require("plugins.config.rest-nvim")
    end,
    ft = "http",
  },

  -- Markdown
  { "previm/previm", ft = "markdown", dependencies = "tyru/open-browser.vim" },

  -- Optional (Trial)
  {
    "tyru/open-browser.vim",
    config = function()
      vim.keymap.set("n", "<Leader>rj", "<Plug>(openbrowser-smart-search)", { noremap = true, silent = true })
    end,
    event = "VeryLazy",
  },
}
