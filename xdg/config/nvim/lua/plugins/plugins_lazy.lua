local m = {
  dap_enabled = false,
}

return {
  -- Theme
  {
    "sainnhe/gruvbox-material",
    config = function()
      require("plugins.config.gruvbox-material")
    end,
    lazy = false,
    priority = 1000,
  },

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
  "tpope/vim-surround",
  {
    "abecodes/tabout.nvim",
    config = function()
      require("plugins.config.tabout")
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "BufReadPre",
    config = function()
      require("plugins.config.hlslens")
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
    "numToStr/Comment.nvim",
    config = function()
      require("plugins.config.comment")
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- Util
  {
    "Pocco81/AutoSave.nvim",
    config = function()
      require("plugins.config.autosave")
    end,
    event = { "InsertLeave", "TextChanged" },
  },
  -- "editorconfig/editorconfig-vim",
  { "ethanholz/nvim-lastplace", config = true },

  -- colorizer
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    config = true,
  },
  "nvim-lua/plenary.nvim",

  -- Speedup
  "lewis6991/impatient.nvim",

  -- UI & Interface
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("plugins.config.bufferline")
    end,
  },
  -- dashboard
  {
    "goolord/alpha-nvim",
    config = function()
      require("plugins.config.alpha")
    end,
  },

  { "nvim-tree/nvim-web-devicons", config = true },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.config.lualine")
    end,
  },
  "ryanoasis/vim-devicons",
  "simeji/winresizer",
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("plugins.config.nvim-tree")
    end,
    cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
    event = "VeryLazy",
  },

  -- Notification
  {
    "rcarriga/nvim-notify",
    config = function()
      require("plugins.config.notify")
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("plugins.config.treesitter")
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
      -- "JoosepAlviste/nvim-ts-context-commentstring",
      -- "p00f/nvim-ts-rainbow", -- no longer maintained
    },
  },

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

  -- Completion
  {
    "rafamadriz/friendly-snippets",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      {
        "onsails/lspkind-nvim",
        config = function()
          require("plugins.config.lspkind")
        end,
      },
      "saadparwaiz1/cmp_luasnip",
      { "L3MON4D3/LuaSnip", version = "1.*", run = "make install_jsregexp" },
      { "tzachar/cmp-tabnine", build = "./install.sh", dependencies = "hrsh7th/nvim-cmp" },
    },
    config = function()
      require("plugins.config.luasnip")
      require("plugins.config.cmp")
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("plugins.config.telescope")
    end,
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
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

  -- Tmux
  "christoomey/vim-tmux-navigator",

  -- Optional (Trial)
  {
    "tyru/open-browser.vim",
    config = function()
      moriso.map("n", "<Leader>rj", "<Plug>(openbrowser-smart-search)")
    end,
    event = "VeryLazy",
  },
}
