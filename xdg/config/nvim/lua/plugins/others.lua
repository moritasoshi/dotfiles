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
  {
    "simeji/winresizer",
    keys = {
      { "<LEFT>", ":WinResizerStartResize<CR>h<CR>" },
      { "<DOWN>", ":WinResizerStartResize<CR>j<CR>" },
      { "<UP>", ":WinResizerStartResize<CR>k<CR>" },
      { "<RIGHT>", ":WinResizerStartResize<CR>l<CR>" },
    },
  },

  -- HTTP Client
  {
    "NTBBloodbath/rest.nvim",
    config = function()
      require("plugins.config.rest-nvim")
    end,
    keys = {
      { "<leader>rr", "<Plug>RestNvim", "Run request under cursor" },
      { "<leader>rp", "<Plug>RestNvimPreview", "Preview request cURL command" },
    },
    ft = "http",
  },

  -- Markdown
  { "previm/previm", ft = "markdown", dependencies = "tyru/open-browser.vim" },

  -- Optional (Trial)
  {
    "tyru/open-browser.vim",
    keys = {
      { "<leader>rj", "<Plug>(openbrowser-smart-search)", desc = "Open URI with browser" },
    },
    event = "VeryLazy",
  },
}
