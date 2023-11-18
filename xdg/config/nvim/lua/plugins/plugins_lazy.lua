if true then
  return {}
end

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
  "tpope/vim-repeat",
  "tpope/vim-speeddating",
  {
    "abecodes/tabout.nvim",
    config = function()
      require("plugins.config.tabout")
    end,
  },

  -- UI & Interface
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.config.lualine")
    end,
  },

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
      moriso.map("n", "<Leader>rj", "<Plug>(openbrowser-smart-search)")
    end,
    event = "VeryLazy",
  },
}
