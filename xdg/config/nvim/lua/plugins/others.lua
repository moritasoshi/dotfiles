return {
  -- Text manipulation
  {
    "godlygeek/tabular",
    config = function()
      vim.cmd([[
      AddTabularPattern! nvar /nvarchar(\w*)/l1r0
      AddTabularPattern! f_comma /^[^,]*\zs,/l0l1
      AddTabularPattern! comma /,\zs,/l0l1
      AddTabularPattern! f_colon /^[^:]*\zs:\zs/l0r1
      AddTabularPattern! f_equal /^[^=]*\zs=/
      AddTabularPattern! f_quote /^[^"]*\zs"/l1r0
      AddTabularPattern! f_space /^[^ ]*\zs /l0
      ]])
    end,
    cmd = "Tabularize",
    keys = {
      { "<leader>t", ":Tabularize /", desc = "Tabularize" },
    },
  },
  { "ntpeters/vim-better-whitespace", event = { "InsertLeave", "TextChanged" } },

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
