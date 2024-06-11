return {
  -- UI & Interface
  {
    "simeji/winresizer",
    keys = {
      { "<LEFT>", "<cmd>WinResizerStartResize<CR>h<CR>" },
      { "<DOWN>", "<cmd>WinResizerStartResize<CR>j<CR>" },
      { "<UP>", "<cmd>WinResizerStartResize<CR>k<CR>" },
      { "<RIGHT>", "<cmd>WinResizerStartResize<CR>l<CR>" },
    },
  },

  -- HTTP Client
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
    },
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    opts = {
      -- Open request results in a horizontal split
      result_split_horizontal = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      -- Jump to request line on run
      jump_to_request = false,
    },
    keys = {
      { "<leader>rr", "<Plug>RestNvim", desc = "Run request under cursor" },
      { "<leader>rp", "<Plug>RestNvimPreview", desc = "Preview request cURL command" },
    },
    config = function()
      require("rest-nvim").setup()
    end,
  },

  -- Optional (Trial)
  {
    "tyru/open-browser.vim",
    keys = {
      { "<leader>rj", "<Plug>(openbrowser-smart-search)", desc = "Open URI with browser" },
    },
    event = "VeryLazy",
  },
}
