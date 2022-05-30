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
  -- ["tpope/vim-abolish"] = {},
  -- ["haya14busa/vim-asterisk"] = {},
  ["RRethy/vim-illuminate"] = {},
  ["godlygeek/tabular"] = {
    cmd = "Tabularize",
    config = function()
      vim.cmd([[
        AddTabularPattern! nvar /nvarchar(\w*)/l1r0
        AddTabularPattern! f_comma /^[^,]*\zs,/l0l1
        AddTabularPattern! f_colon /^[^:]*\zs:/
        AddTabularPattern! f_equal /^[^=]*\zs=/
        AddTabularPattern! f_quote /^[^"]*\zs"/l1r0
        AddTabularPattern! f_space /^[^ ]*\zs /l0
      ]])
    end,
  },
  ["ntpeters/vim-better-whitespace"] = { event = { "InsertLeave", "TextChanged" } },
  ["tpope/vim-repeat"] = {},
  ["tpope/vim-speeddating"] = {},
  ["tpope/vim-surround"] = {},
  ["abecodes/tabout.nvim"] = { config = get_config("tabout") },
  ["kevinhwang91/nvim-hlslens"] = { config = get_config("hlslens") },
  ["lukas-reineke/indent-blankline.nvim"] = {
    commit = "8567ac8ccd19ee41a6ec55bf044884799fa3f56b",
    config = get_config("indentline"),
    event = "VimEnter",
  },
  ["numToStr/Comment.nvim"] = { config = get_config("comment"), keys = { "gb", "gc", "gcc" } },
  ["windwp/nvim-autopairs"] = { config = get_config("autopairs"), event = "InsertEnter" },

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
    event = "VimEnter",
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
    event = "VimEnter",
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
  ["nvim-treesitter/nvim-treesitter"] = {
    config = get_config("treesitter"),
    run = ":TSUpdate",
  },
  ["JoosepAlviste/nvim-ts-context-commentstring"] = { after = "nvim-treesitter" },
  ["p00f/nvim-ts-rainbow"] = { after = "nvim-treesitter" },
  ["windwp/nvim-ts-autotag"] = {
    after = "nvim-treesitter",
    ft = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
  },

  -- Git
  ["TimUntersberger/neogit"] = { cmd = { "Neogit" }, config = get_config("neogit") },
  -- ["f-person/git-blame.nvim"] = {},
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
  ["williamboman/nvim-lsp-installer"] = { event = "VimEnter" },
  ["neovim/nvim-lspconfig"] = { after = "nvim-lsp-installer" },
  ["b0o/schemastore.nvim"] = { after = "nvim-lspconfig" },
  ["folke/lua-dev.nvim"] = { after = "schemastore.nvim" },
  ["mfussenegger/nvim-jdtls"] = { after = "lua-dev.nvim", config = get_config("lsp") },
  ["j-hui/fidget.nvim"] = { after = "nvim-jdtls", config = get_config("fidget") },
  ["jose-elias-alvarez/null-ls.nvim"] = { after = "nvim-jdtls", config = get_config("lsp.null-ls") }, -- run "brew install stylua"
  ["folke/trouble.nvim"] = { cmd = { "TroubleToggle" }, config = get_config("trouble") },

  -- Completion
  ["rafamadriz/friendly-snippets"] = { event = { "InsertEnter", "CmdlineEnter" } },
  ["L3MON4D3/LuaSnip"] = { after = "friendly-snippets", config = get_config("luasnip") },
  ["onsails/lspkind-nvim"] = { after = "LuaSnip" },
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
  ["previm/previm"] = { ft = "markdown", requires = "tyru/open-browser.vim" },

  -- Zen
  -- ["folke/twilight.nvim"] = { after = "zen", config = get_config("twilight") },
  -- ["folke/zen-mode.nvim"] = { as = "zen", cmd = "ZenMode", config = get_config("zen") },

  -- Tmux
  ["christoomey/vim-tmux-navigator"] = {},

  -- Optional (Trial)
  ["tyru/open-browser.vim"] = {
    event = "VimEnter",
    config = function()
      require("moritasoshi.util.keymap").nmap { "<Leader>rj", "<Plug>(openbrowser-smart-search)" }
    end,
  },
}

require("core.packer").run(plugins)
