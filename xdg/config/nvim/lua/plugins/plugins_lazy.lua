if true then
  return {}
end

local m = {
  dap_enabled = false,
}

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
  -- indent guidelines
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
    config = function()
      require("plugins.config.indentline")
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- colorizer
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    config = true,
  },
  "nvim-lua/plenary.nvim",

  -- UI & Interface
  { "nvim-tree/nvim-web-devicons", config = true },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.config.lualine")
    end,
  },
  "ryanoasis/vim-devicons",
  "simeji/winresizer",

  -- Git
  -- ["f-person/git-blame.nvim"] ,
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
    },
    cmd = { "Neogit" },
    config = true,
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      require("plugins.config.git-conflict")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.config.gitsigns")
    end,
  },
  "rhysd/committia.vim",

  -- LSP
  {
    "williamboman/mason.nvim",
    config = function()
      require("plugins.config.lsp")
    end,
  },
  "williamboman/mason-lspconfig.nvim",

  "neovim/nvim-lspconfig",
  "b0o/schemastore.nvim",
  "folke/neodev.nvim",
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function()
      require("plugins.config.fidget")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("plugins.config.lsp.null-ls")
    end,
  },
  {
    "folke/trouble.nvim",
    config = function()
      require("plugins.config.trouble")
    end,
    cmd = { "TroubleToggle" },
  },

  -- Debug Adapter
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("plugins.config.dap/nvim-dap")
    end,
    enabled = m.dap_enabled,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("plugins.config.dap/dapui")
    end,
    enabled = m.dap_enabled,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("plugins.config.dap/nvim-dap-virtual-text")
    end,
    enabled = m.dap_enabled,
  },
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("plugins.config.dap/dap-go")
    end,
    enabled = m.dap_enabled,
    ft = "go",
  },

  -- Go Development
  {
    "ray-x/go.nvim",
    config = function()
      require("plugins.config.go")
    end,
    ft = "go",
  },
  {
    "ray-x/navigator.lua",
    dependencies = {
      { "ray-x/guihua.lua", build = "cd lua/fzy && make" },
      { "neovim/nvim-lspconfig" },
    },
    ft = "go",
  },

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
