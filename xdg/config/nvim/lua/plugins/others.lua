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

  -- Optional (Trial)
  {
    "tyru/open-browser.vim",
    keys = {
      { "<leader>rj", "<Plug>(openbrowser-smart-search)", desc = "Open URI with browser" },
    },
    event = "VeryLazy",
  },
}
