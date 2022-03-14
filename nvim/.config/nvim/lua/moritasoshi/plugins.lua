local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local get_config = function(name)
  return string.format('require("moritasoshi.config.%s")', name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system {
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  execute("packadd packer.nvim")
end

-- initialize and configure packer
local packer = require("packer")
packer.init {
  -- Move packer_compiled lua dir so impatient.nvim can cache it
  compile_path = fn.stdpath("config") .. "/lua/moritasoshi/packer_compiled.lua",
}
local use = packer.use
packer.reset()

-- ============================================================
-- =====================  Packer Plugins  =====================
-- ============================================================

use { "wbthomason/packer.nvim" }

-- Theme
use { "sainnhe/gruvbox-material" }
-- use { "doums/darcula" }

-- Text manipulation
use { "godlygeek/tabular" } -- Quickly align text by pattern
use { "dkarter/bullets.vim" }
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
use { "moritasoshi/plenary.nvim" }
-- use { "nvim-lua/plenary.nvim", lock = true } -- I hardcoding for bug fix, So freeze
-- Details of the bug fix (https://github.com/nvim-lua/plenary.nvim/issues/269)
-- /Users/morita/.local/share/nvim/site/pack/packer/start/plenary.nvim/lua/plenary/curl.lua
--   return vim.tbl_flatten {
--     "-sSL",
--     opts.dump,
--     opts.compressed and "--compressed" or '',
--     parse.method(opts.method) or '',
--     parse.headers(opts.headers) or '',
--     parse.accept_header(opts.accept) or '',
--     parse.raw_body(opts.raw_body) or '',
--     parse.data_body(opts.data) or '',
--     parse.form(opts.form) or '',
--     parse.file(opts.in_file) or '',
--     parse.auth(opts.auth) or '',
--     opts.raw or '',
--     opts.output and { "-o", opts.output } or '',
--     parse.url(opts.url, opts.query) or '',
--   }, opts
use { "Pocco81/AutoSave.nvim", event = { "InsertLeave", "TextChanged" }, config = get_config("autosave") }
use { "farmergreg/vim-lastplace" } -- Memory line
use { "editorconfig/editorconfig-vim" }
use { "sudormrfbin/cheatsheet.nvim" }
use {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup()
  end,
}
use {
  "akinsho/nvim-toggleterm.lua",
  keys = { "<C-y>", "<leader>fl", "<leader>gt" },
  config = get_config("toggleterm"),
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
  cmd = { "NvimTreeToggle" },
  config = function()
    require("nvim-tree").setup()
  end,
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
use { "ellisonleao/glow.nvim", cmd = "Glow" }

-- Zen
use { "folke/zen-mode.nvim", as = "zen", cmd = "ZenMode", config = get_config("zen") }
use { "folke/twilight.nvim", after = "zen", config = get_config("twilight") }

-- Tmux
use { "christoomey/vim-tmux-navigator" }
