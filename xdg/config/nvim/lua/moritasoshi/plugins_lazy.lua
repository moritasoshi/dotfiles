local m = {
  dap_enabled = false,
}
return {
  -- Theme
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      require("moritasoshi.config.gruvbox-material")
    end,
  },

  -- Text manipulation
  {
    "godlygeek/tabular",
    cmd = "Tabularize",
    config = function()
      require("moritasoshi.config.tabular")
    end,
  },
  { "ntpeters/vim-better-whitespace", event = { "InsertLeave", "TextChanged" } },
  "tpope/vim-repeat",
  "tpope/vim-speeddating",
  "tpope/vim-surround",
  {
    "abecodes/tabout.nvim",
    config = function()
      require("moritasoshi.config.tabout")
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("moritasoshi.config.hlslens")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("moritasoshi.config.indentline")
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("moritasoshi.config.comment")
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("moritasoshi.config.autopairs")
    end,
    event = "InsertEnter",
  },

  -- Util
  {
    "Pocco81/AutoSave.nvim",
    event = { "InsertLeave", "TextChanged" },
    config = function()
      require("moritasoshi.config.autosave")
    end,
  },
  "editorconfig/editorconfig-vim",
  "farmergreg/vim-lastplace",
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      local present, colorizer = pcall(require, "colorizer")
      if not present then
        return
      end
      colorizer.setup()
    end,
  },
  "nvim-lua/plenary.nvim",

  -- Speedup
  "lewis6991/impatient.nvim",

  -- UI & Interface
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("moritasoshi.config.bufferline")
    end,
  },
  {
    "goolord/alpha-nvim",
    config = function()
      require("moritasoshi.config.alpha")
    end,
  },

  {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("moritasoshi.config.web-devicons")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("moritasoshi.config.lualine")
    end,
  },
  "ryanoasis/vim-devicons",
  "simeji/winresizer",
  {
    "kyazdani42/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
    config = function()
      require("moritasoshi.config.nvim-tree")
    end,
    ft = "alpha",
  },

  -- Notification
  {
    "rcarriga/nvim-notify",
    config = function()
      require("moritasoshi.config.notify")
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("moritasoshi.config.treesitter")
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "p00f/nvim-ts-rainbow",
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
  },

  -- Git
  -- ["f-person/git-blame.nvim"] ,
  {
    "TimUntersberger/neogit",
    cmd = { "Neogit" },
    config = function()
      require("moritasoshi.config.neogit")
    end,
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      require("moritasoshi.config.git-conflict")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("moritasoshi.config.gitsigns")
    end,
  },
  "rhysd/committia.vim",

  -- LSP
  {
    "williamboman/mason.nvim",
    config = function()
      require("moritasoshi.config.lsp")
    end,
  },
  "williamboman/mason-lspconfig.nvim",

  "neovim/nvim-lspconfig",
  "b0o/schemastore.nvim",
  "folke/neodev.nvim",
  {
    "j-hui/fidget.nvim",
    config = function()
      require("moritasoshi.config.fidget")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("moritasoshi.config.lsp.null-ls")
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle" },
    config = function()
      require("moritasoshi.config.trouble")
    end,
  },

  -- Debug Adapter
  {
    "mfussenegger/nvim-dap",
    enabled = m.dap_enabled,
    config = function()
      require("moritasoshi.config.dap/nvim-dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    enabled = m.dap_enabled,
    config = function()
      require("moritasoshi.config.dap/dapui")
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    enabled = m.dap_enabled,
    config = function()
      require("moritasoshi.config.dap/nvim-dap-virtual-text")
    end,
  },
  {
    "leoluz/nvim-dap-go",
    enabled = m.dap_enabled,
    config = function()
      require("moritasoshi.config.dap/dap-go")
    end,
  },

  -- Go Development
  {
    "ray-x/go.nvim",
    config = function()
      require("moritasoshi.config.go")
    end,
  },
  {
    "ray-x/navigator.lua",
    dependencies = {
      { "ray-x/guihua.lua", build = "cd lua/fzy && make" },
      { "neovim/nvim-lspconfig" },
    },
  },

  -- Completion
  { "rafamadriz/friendly-snippets", event = { "InsertEnter", "CmdlineEnter" } },
  {
    "L3MON4D3/LuaSnip",
    dependencies = "friendly-snippets",
    config = function()
      require("moritasoshi.config.luasnip")
    end,
  },
  { "onsails/lspkind-nvim", dependencies = "LuaSnip" },
  { "hrsh7th/nvim-cmp", dependencies = "lspkind-nvim" },
  { "saadparwaiz1/cmp_luasnip", dependencies = "nvim-cmp" },
  { "hrsh7th/cmp-nvim-lua", dependencies = "cmp_luasnip" },
  { "hrsh7th/cmp-nvim-lsp", dependencies = "cmp-nvim-lua" },
  { "hrsh7th/cmp-buffer", dependencies = "cmp-nvim-lsp" },
  { "hrsh7th/cmp-path", dependencies = "cmp-buffer" },
  { "hrsh7th/cmp-cmdline", dependencies = "cmp-path" },
  {
    "tzachar/cmp-tabnine",
    dependencies = "cmp-cmdline",
    config = function()
      require("moritasoshi.config.compe")
    end,
    build = "./install.sh",
  },

  -- Telescope
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("moritasoshi.config.telescope")
    end,
  },

  -- HTTP Client
  {
    "NTBBloodbath/rest.nvim",
    ft = "http",
    config = function()
      require("moritasoshi.config.rest-nvim")
    end,
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
  },
}
