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

-- Text manipulation
-- use { "ThePrimeagen/harpoon", config = get_config("harpoon") }
-- use { "dkarter/bullets.vim" }
-- use { "ggandor/lightspeed.nvim", event = "BufReadPre" }
use { "JoosepAlviste/nvim-ts-context-commentstring" }
use { "RRethy/vim-illuminate" }
use { "abecodes/tabout.nvim", config = get_config("tabout") }
use { "godlygeek/tabular" } -- Quickly align text by pattern
use { "haya14busa/vim-asterisk" }
use { "kevinhwang91/nvim-hlslens", config = get_config("hlslens") }
use { "lukas-reineke/indent-blankline.nvim", config = get_config("indentline") }
use { "ntpeters/vim-better-whitespace" }
use { "numToStr/Comment.nvim", config = get_config("comment") }
use { "tpope/vim-abolish" }
use { "tpope/vim-repeat" }
use { "tpope/vim-speeddating" }
use { "tpope/vim-surround" }
use { "windwp/nvim-autopairs", config = get_config("autopairs") }

-- Util
use { "Pocco81/AutoSave.nvim", event = { "InsertLeave", "TextChanged" }, config = get_config("autosave") }
use { "editorconfig/editorconfig-vim" }
use { "farmergreg/vim-lastplace" } -- Memory line
use {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup()
  end,
}
use { "nvim-lua/plenary.nvim" }

-- Speedup
use { "dstein64/vim-startuptime", cmd = "StartupTime" }
use { "lewis6991/impatient.nvim" }
use { "nathom/filetype.nvim" } -- Replacement for the included filetype.vim

-- UI & Interface
use { "akinsho/bufferline.nvim", config = get_config("bufferline") }
use { "goolord/alpha-nvim", config = get_config("alpha") }
use {
  "karb94/neoscroll.nvim",
  config = get_config("neoscroll"),
  keys = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
}
use {
  "kyazdani42/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
  config = get_config("nvim-tree"),
}
use { "kyazdani42/nvim-web-devicons", config = get_config("web-devicons") }
use { "nvim-lualine/lualine.nvim", config = get_config("lualine") }
use { "ryanoasis/vim-devicons" }
use { "simeji/winresizer" }

-- Notification
use {
  "rcarriga/nvim-notify",
  config = function()
    vim.notify = require("notify")
  end,
}

-- Treesitter
use { "nvim-treesitter/nvim-treesitter", config = get_config("treesitter"), run = ":TSUpdate" }
use { "p00f/nvim-ts-rainbow" }

-- Git
use { "TimUntersberger/neogit", cmd = { "Neogit" }, config = get_config("neogit") }
use { "f-person/git-blame.nvim" }
use { "lewis6991/gitsigns.nvim", config = get_config("gitsigns") }
use { "rhysd/committia.vim" }
use { "sindrets/diffview.nvim", after = { "neogit" }, cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" }, config = get_config("diffview"), }

-- LSP
use { "b0o/schemastore.nvim" } -- schemastore.org
use { "folke/lua-dev.nvim" }
use { "folke/trouble.nvim", cmd = { "TroubleToggle" }, config = get_config("trouble"), }
--- lsp progress
use { "j-hui/fidget.nvim", config = function() require("fidget").setup() end, }
use { "jose-elias-alvarez/null-ls.nvim", commit = "c832a0ecb18fac8b35967111327434edf6f782aa" } -- Run `brew install stylua`
use { "mfussenegger/nvim-jdtls" }
use { "neovim/nvim-lspconfig" }
use { "nvim-lua/lsp-status.nvim" }
use { "williamboman/nvim-lsp-installer" }

-- Completion
use { "L3MON4D3/LuaSnip" }
use { "hrsh7th/cmp-buffer" }
use { "hrsh7th/cmp-cmdline" }
use { "hrsh7th/cmp-nvim-lsp" }
use { "hrsh7th/cmp-path" }
use { "hrsh7th/nvim-cmp" }
use { "onsails/lspkind-nvim" }
use { "rafamadriz/friendly-snippets" }
use { "saadparwaiz1/cmp_luasnip" }
use { "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" }

-- Telescope
use { "nvim-telescope/telescope-frecency.nvim", requires = { "tami5/sqlite.lua" } }
use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
use { "nvim-telescope/telescope.nvim", config = get_config("telescope") }

-- HTTP Client
use { "NTBBloodbath/rest.nvim" }

-- Markdown
use { "previm/previm", requires = "tyru/open-browser.vim" }

-- Zen
use { "folke/twilight.nvim", after = "zen", config = get_config("twilight") }
use { "folke/zen-mode.nvim", as = "zen", cmd = "ZenMode", config = get_config("zen") }

-- Tmux
use { "christoomey/vim-tmux-navigator" }

-- Optional (Trial)
use {
  "tyru/open-browser.vim",
  config = function()
    require("moritasoshi.util.keymap").nmap {
      "<Leader>rj",
      "<Plug>(openbrowser-smart-search)",
    }
  end,
}
-- sandwich
