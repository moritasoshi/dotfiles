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
      { "<LEFT>", "<cmd>WinResizerStartResize<CR>h<CR>" },
      { "<DOWN>", "<cmd>WinResizerStartResize<CR>j<CR>" },
      { "<UP>", "<cmd>WinResizerStartResize<CR>k<CR>" },
      { "<RIGHT>", "<cmd>WinResizerStartResize<CR>l<CR>" },
    },
  },

  -- HTTP Client
  {
    "NTBBloodbath/rest.nvim",
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
      { "<leader>rr", "<Plug>RestNvim", "Run request under cursor" },
      { "<leader>rp", "<Plug>RestNvimPreview", "Preview request cURL command" },
    },
    ft = "http",
  },

  -- Markdown
  {
    "previm/previm",
    keys = {
      { "<Leader>mm", "<cmd>PrevimOpen<CR>", { desc = "Markdown preview" } },
    },
    ft = "markdown",
    dependencies = "tyru/open-browser.vim",
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
