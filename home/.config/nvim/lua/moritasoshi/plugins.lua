-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local get_config = function(name)
  return string.format('require("moritasoshi.config.%s")', name)
end

-- initialize and configure packer
local packer = require("packer")
packer.init {
  -- Move packer_compiled lua dir so impatient.nvim can cache it
  compile_path = "~/src/dotfiles/home/.config/nvim" .. "/lua/moritasoshi/packer_compiled.lua",
  max_jobs = 3, -- https://github.com/wbthomason/packer.nvim/issues/746
}
local use = packer.use
packer.reset()

vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile]])

-- ============================================================
-- =====================  Packer Plugins  =====================
-- ============================================================

use { "wbthomason/packer.nvim" }

-- Theme
use { "sainnhe/gruvbox-material" }
-- use { "doums/darcula" }

-- Text manipulation
use { "godlygeek/tabular" } -- Quickly align text by pattern
-- use { "dkarter/bullets.vim" }
use { "tpope/vim-abolish" }
use { "tpope/vim-repeat" }
use { "tpope/vim-speeddating" }
use { "tpope/vim-surround" }
use { "numToStr/Comment.nvim", config = get_config("comment") }
use { "JoosepAlviste/nvim-ts-context-commentstring" }
use { "lukas-reineke/indent-blankline.nvim", config = get_config("indentline") }
use { "ntpeters/vim-better-whitespace" }
use { "RRethy/vim-illuminate" }
-- use { "ggandor/lightspeed.nvim", event = "BufReadPre" }
-- use { "ThePrimeagen/harpoon", config = get_config("harpoon") }
use { "windwp/nvim-autopairs", config = get_config("autopairs") }

-- Util
use { "nvim-lua/plenary.nvim" }
use { "Pocco81/AutoSave.nvim", event = { "InsertLeave", "TextChanged" }, config = get_config("autosave") }
use { "farmergreg/vim-lastplace" } -- Memory line
use { "editorconfig/editorconfig-vim" }
use {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup()
  end,
}

-- Speedup
use { "lewis6991/impatient.nvim" }
use { "nathom/filetype.nvim" } -- Replacement for the included filetype.vim
use { "dstein64/vim-startuptime", cmd = "StartupTime" }

-- UI & Interface
use {
  "goolord/alpha-nvim",
  commit = "735d69022c0e9fe224e3e2e3cea30ca0e3e0f8ba", -- https://github.com/goolord/alpha-nvim/issues/92
  config = get_config("alpha"),
}
use { "nvim-lualine/lualine.nvim", config = get_config("lualine") }
use {
  "kyazdani42/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
  config = get_config("nvim-tree"),
}
use { "ryanoasis/vim-devicons" }
use { "kyazdani42/nvim-web-devicons", config = get_config("web-devicons") }
use { "akinsho/bufferline.nvim", config = get_config("bufferline") }
use {
  "karb94/neoscroll.nvim",
  config = get_config("neoscroll"),
  keys = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
}

-- Notification
use {
  "rcarriga/nvim-notify",
  config = function()
    vim.notify = require("notify")
  end,
}

-- Treesitter
use { "nvim-treesitter/nvim-treesitter", config = get_config("treesitter") }
use { "p00f/nvim-ts-rainbow" }
-- use {
--   "lewis6991/spellsitter.nvim",
--   config = function()
--     require("spellsitter").setup()
--   end,
-- }

-- Git
use { "lewis6991/gitsigns.nvim", config = get_config("gitsigns") }
use { "TimUntersberger/neogit", cmd = { "Neogit" }, config = get_config("neogit") }
use {
  "sindrets/diffview.nvim",
  after = { "neogit" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  config = get_config("diffview"),
}
use { "f-person/git-blame.nvim" }
use { "rhysd/committia.vim" }

-- LSP
use { "neovim/nvim-lspconfig" }
use { "williamboman/nvim-lsp-installer" }
use { "jose-elias-alvarez/null-ls.nvim" } -- Run `brew install stylua`
use { "nvim-lua/lsp-status.nvim" }
use { "folke/lua-dev.nvim" }
use { "ray-x/lsp_signature.nvim" }
use {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle" },
  config = get_config("trouble"),
}
use { "arkav/lualine-lsp-progress" }
use { "b0o/schemastore.nvim" } -- schemastore.org
use { "mfussenegger/nvim-jdtls" }

-- Completion
use { "hrsh7th/nvim-cmp" }
use { "hrsh7th/cmp-nvim-lsp" }
use { "hrsh7th/cmp-buffer" }
use { "hrsh7th/cmp-path" }
use { "hrsh7th/cmp-cmdline" }
use { "L3MON4D3/LuaSnip" }
use { "saadparwaiz1/cmp_luasnip" }
use { "rafamadriz/friendly-snippets" }
use { "onsails/lspkind-nvim" }
use { "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" }

-- Telescope
use { "nvim-telescope/telescope.nvim", config = get_config("telescope") }
use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
use { "nvim-telescope/telescope-frecency.nvim", requires = { "tami5/sqlite.lua" } }

-- HTTP Client
use { "NTBBloodbath/rest.nvim" }

-- Markdown
-- use { "ellisonleao/glow.nvim", cmd = "Glow" }
use { "previm/previm", requires = "tyru/open-browser.vim" }

-- Zen
use { "folke/zen-mode.nvim", as = "zen", cmd = "ZenMode", config = get_config("zen") }
use { "folke/twilight.nvim", after = "zen", config = get_config("twilight") }

-- Tmux
use { "christoomey/vim-tmux-navigator" }

-- Optional (Trial)
use { "arthurxavierx/vim-caser" }
use { "simeji/winresizer" }
use {
  "tyru/open-browser.vim",
  config = function()
    require("moritasoshi.util.keymap").map {
      { "n", "v" },
      "<Leader>rj",
      "<Plug>(openbrowser-smart-search)",
    }
  end,
}
use { "kevinhwang91/nvim-hlslens", config = get_config("hlslens") }
use { "haya14busa/vim-asterisk" }
use { "tamago324/nlsp-settings.nvim" }
use {
  "abecodes/tabout.nvim",
  config = function()
    require("tabout").setup {
      enable_backwards = true,
      completion = true,
      tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = "`", close = "`" },
        { open = "(", close = ")" },
        { open = "[", close = "]" },
        { open = "{", close = "}" },
        { open = "<", close = ">" },
        { open = "#", close = "]" },
      },
    }

    vim.api.nvim_set_keymap("i", "<A-x>", "<Plug>(TaboutMulti)", { silent = true })
    vim.api.nvim_set_keymap("i", "<A-z>", "<Plug>(TaboutBackMulti)", { silent = true })
  end,
}
-- sandwich
-- use {
--   "ahmedkhalf/project.nvim",
--   config = function()
--     require("project_nvim").setup {
--       -- your configuration comes here
--       -- or leave it empty to use the default settings
--       -- refer to the configuration section below
--     }
--   end,
-- }
-- use { "simrat39/symbols-outline.nvim" }
