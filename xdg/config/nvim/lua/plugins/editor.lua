return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    opts = {
      disable_builtin_notifications = true,
      disable_commit_confirmation = true,
      integrations = {
        diffview = true,
      },
    },
    keys = {
      { "<leader>G", "<cmd>Neogit<cr>", desc = "Open Neogit" },
    },
  },
}
