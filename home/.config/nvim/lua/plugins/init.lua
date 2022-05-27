local get_config = function(name)
  return string.format('require("moritasoshi.config.%s")', name)
end

local plugins = {
  ["wbthomason/packer.nvim"] = {},

  -- Theme
  ["sainnhe/gruvbox-material"] = {
    config = function()
      vim.g.gruvbox_material_palette = "mix" -- material, mix, original
      vim.g.gruvbox_material_background = "hard" -- soft. medium, hard
      vim.g.gruvbox_material_enable_italic = 1
      vim.cmd([[colorscheme gruvbox-material]])
      vim.cmd([[highlight CursorLine guibg=#393939]])
    end,
  },

  -- Text manipulation
  -- use { "ThePrimeagen/harpoon", config = get_config("harpoon") }
  -- use { "dkarter/bullets.vim" }
  -- use { "ggandor/lightspeed.nvim", event = "BufReadPre" }
  ["RRethy/vim-illuminate"] = {},
  ["godlygeek/tabular"] = {},
  ["haya14busa/vim-asterisk"] = {},
  ["ntpeters/vim-better-whitespace"] = {},
  ["tpope/vim-abolish"] = {},
  ["tpope/vim-repeat"] = {},
  ["tpope/vim-speeddating"] = {},
  ["tpope/vim-surround"] = {},
  ["abecodes/tabout.nvim"] = { config = get_config("tabout") },
  ["kevinhwang91/nvim-hlslens"] = { config = get_config("hlslens") },
  ["lukas-reineke/indent-blankline.nvim"] = {
    commit = "8567ac8ccd19ee41a6ec55bf044884799fa3f56b",
    config = get_config("indentline"),
    event = "BufRead",
  },
  ["numToStr/Comment.nvim"] = { config = get_config("comment"), keys = { "gb", "gc", "gcc" } },
  ["windwp/nvim-autopairs"] = { config = get_config("autopairs") },

  -- Util
  ["Pocco81/AutoSave.nvim"] = { event = { "InsertLeave", "TextChanged" }, config = get_config("autosave") },
  ["editorconfig/editorconfig-vim"] = {},
  ["farmergreg/vim-lastplace"] = {},
  ["norcalli/nvim-colorizer.lua"] = {
    config = function()
      local present, colorizer = pcall(require, "colorizer")
      if not present then
        return
      end
      colorizer.setup()
    end,
    event = "BufRead",
  },
  ["nvim-lua/plenary.nvim"] = {},

  -- Speedup
  ["dstein64/vim-startuptime"] = { cmd = "StartupTime" },
  ["lewis6991/impatient.nvim"] = {},

  -- UI & Interface
  ["akinsho/bufferline.nvim"] = { config = get_config("bufferline") },
  ["goolord/alpha-nvim"] = { config = get_config("alpha") },
  ["karb94/neoscroll.nvim"] = { config = get_config("neoscroll") },

  ["kyazdani42/nvim-web-devicons"] = { config = get_config("web-devicons") },
  ["nvim-lualine/lualine.nvim"] = {
    config = get_config("lualine"),
    setup = function()
      moriso.packer_lazy_load("lualine.nvim")
    end,
  },
  ["ryanoasis/vim-devicons"] = {},
  ["simeji/winresizer"] = {},
  ["kyazdani42/nvim-tree.lua"] = {
    cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
    config = get_config("nvim-tree"),
    ft = "alpha",
  },
  ["stevearc/dressing.nvim"] = {
    config = function()
      local present, dressing = pcall(require, "dressing")
      if not present then
        return
      end
      dressing.setup {
        input = {
          winblend = 10,
          winhighlight = "Normal:DressingInputNormalFloat,NormalFloat:DressingInputNormalFloat,FloatBorder:DressingInputFloatBorder",
          border = "single",
        },
      }
    end,
  },

  -- Notification
  ["rcarriga/nvim-notify"] = {
    config = function()
      local present, notify = pcall(require, "notify")
      if not present then
        return
      end
      vim.notify = notify
    end,
  },

  -- Treesitter
  ["JoosepAlviste/nvim-ts-context-commentstring"] = { after = "nvim-treesitter" },
  ["nvim-treesitter/nvim-treesitter"] = {
    config = get_config("treesitter"),
    event = "BufEnter",
    run = ":TSUpdate",
  },
  ["p00f/nvim-ts-rainbow"] = { after = "nvim-treesitter" },
  ["windwp/nvim-ts-autotag"] = {
    after = "nvim-treesitter",
    ft = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
  },

  -- Git
  ["TimUntersberger/neogit"] = { cmd = { "Neogit" }, config = get_config("neogit") },
  ["f-person/git-blame.nvim"] = {},
  ["lewis6991/gitsigns.nvim"] = {
    config = get_config("gitsigns"),
    setup = function()
      moriso.packer_lazy_load("gitsigns.nvim")
    end,
  },
  ["rhysd/committia.vim"] = {},
  ["sindrets/diffview.nvim"] = {
    after = { "neogit" },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
    config = get_config("diffview"),
  },
  -- LSP
  ["b0o/schemastore.nvim"] = {},
  ["folke/lua-dev.nvim"] = {},
  ["folke/trouble.nvim"] = { cmd = { "TroubleToggle" }, config = get_config("trouble") },
  --- lsp progress
  ["j-hui/fidget.nvim"] = {
    config = get_config("fidget"),
    setup = function()
      moriso.packer_lazy_load("fidget.nvim")
    end,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = { run = "brew install stylua" },
  ["mfussenegger/nvim-jdtls"] = {},
  ["neovim/nvim-lspconfig"] = {
    after = "nvim-lsp-installer",
    config = function()
      require("moritasoshi.lsp")
    end,
  },
  ["nvim-lua/lsp-status.nvim"] = {},
  ["williamboman/nvim-lsp-installer"] = {
    setup = function()
      moriso.packer_lazy_load("nvim-lsp-installer")
      -- reload the current file so lsp actually starts for it
      vim.defer_fn(function()
        vim.cmd('if &ft == "packer" | echo "" | else | silent! e %')
      end, 0)
    end,
  },

  -- Completion
  ["rafamadriz/friendly-snippets"] = { event = "InsertEnter" },
  ["L3MON4D3/LuaSnip"] = { after = "friendly-snippets", config = get_config("luasnip") },
  ["onsails/lspkind-nvim"] = { after = "LuaSnip", event = "CmdlineEnter" },
  ["hrsh7th/nvim-cmp"] = { after = "lspkind-nvim" },
  ["saadparwaiz1/cmp_luasnip"] = { after = "nvim-cmp" },
  ["hrsh7th/cmp-nvim-lua"] = { after = "cmp_luasnip" },
  ["hrsh7th/cmp-nvim-lsp"] = { after = "cmp-nvim-lua" },
  ["hrsh7th/cmp-buffer"] = { after = "cmp-nvim-lsp" },
  ["hrsh7th/cmp-path"] = { after = "cmp-buffer" },
  ["hrsh7th/cmp-cmdline"] = { after = "cmp-path" },
  ["tzachar/cmp-tabnine"] = {
    after = "cmp-cmdline",
    config = get_config("compe"),
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
  },

  -- Telescope
  ["nvim-telescope/telescope-frecency.nvim"] = { requires = { "tami5/sqlite.lua" } },
  ["nvim-telescope/telescope-fzf-native.nvim"] = { run = "make" },
  ["nvim-telescope/telescope.nvim"] = {
    config = get_config("telescope"),
    setup = function()
      moriso.packer_lazy_load("telescope.nvim")
    end,
  },

  -- HTTP Client
  ["NTBBloodbath/rest.nvim"] = { ft = "http", config = get_config("rest-nvim") },

  -- Markdown
  ["previm/previm"] = { requires = "tyru/open-browser.vim" },

  -- Zen
  -- ["folke/twilight.nvim"] = { after = "zen", config = get_config("twilight") },
  -- ["folke/zen-mode.nvim"] = { as = "zen", cmd = "ZenMode", config = get_config("zen") },

  -- Tmux
  ["christoomey/vim-tmux-navigator"] = {},

  -- Optional (Trial)
  ["tyru/open-browser.vim"] = {
    config = function()
      require("moritasoshi.util.keymap").nmap { "<Leader>rj", "<Plug>(openbrowser-smart-search)" }
    end,
  },
}

require("core.packer").run(plugins)
