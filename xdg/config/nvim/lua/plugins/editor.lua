return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    config = function()
      require("neogit").setup({
        disable_builtin_notifications = true,
        disable_commit_confirmation = true,
        integrations = {
          diffview = true,
        },
      })

      -- TODO: Room for improvement
      vim.cmd("highlight NeogitDiffAddHighlight gui=reverse guifg=#698055")
    end,
    keys = {
      { "<leader>G", "<cmd>Neogit<cr>", desc = "Open Neogit" },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    config = true,
  },
}
