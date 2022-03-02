local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local get_config = function (name)
    return string.format("require(\"moritasoshi.config.%s\")", name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        "git", "clone", "https://github.com/wbthomason/packer.nvim",
        install_path
    })
    execute "packadd packer.nvim"
end

-- initialize and configure packer
local packer = require("packer")
packer.init {
    enable = true, -- enable profiling via :PackerCompile profile=true
    threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
}
local use = packer.use
packer.reset()

use { "wbthomason/packer.nvim" }
use { "nvim-lua/plenary.nvim", lock = true } -- I hardcoding for bug fix, So freeze
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
use { "rcarriga/nvim-notify", config = function () vim.notify = require("notify") end }

use { "dkarter/bullets.vim" }
use { "tpope/vim-abolish" }
use { "tpope/vim-repeat" }
use { "tpope/vim-speeddating" }
use { "tpope/vim-surround" }
use { "farmergreg/vim-lastplace" } -- Memory line
use { "Pocco81/AutoSave.nvim" }
use { "lukas-reineke/indent-blankline.nvim" }
use { "numToStr/Comment.nvim" }
use { "JoosepAlviste/nvim-ts-context-commentstring" }
use { "ntpeters/vim-better-whitespace" }
use { "RRethy/vim-illuminate" }
use { "editorconfig/editorconfig-vim" }
use { "lewis6991/impatient.nvim" }
use { "dstein64/vim-startuptime" }
use { "ggandor/lightspeed.nvim", event = "BufReadPre"}

-- TEXT MANIPULATION
use { "godlygeek/tabular" } -- Quickly align text by pattern


use { "jghauser/mkdir.nvim", config = function () require("mkdir") end }
use { "ThePrimeagen/harpoon", config = get_config("harpoon") }
use {"windwp/nvim-autopairs", config = get_config("autopairs") }
use { "norcalli/nvim-colorizer.lua", config = function () require("colorizer").setup() end }

use { "akinsho/nvim-toggleterm.lua",
  keys = {"<C-y>", "<leader>fl", "<leader>gt"},
  config = get_config("toggleterm")
}

use { "karb94/neoscroll.nvim",
  keys = {"<C-u>", "<C-d>" },
  config = get_config("neoscroll")
}

-- Format
use { "mhartington/formatter.nvim",
  cmd = { "Format", "FormatWrite" },
  enable = false,
  event = "BufWritePre",
  config = get_config("formatter")
}

-- UI & Interface
use { "goolord/alpha-nvim" }
use { "nvim-lualine/lualine.nvim" }
use { "kyazdani42/nvim-tree.lua",
  cmd = { "NvimTreeToggle" },
  commit = "3f4ed9b6c2598ab8304186486a05ae7a328b8d49",
  config = function () require('nvim-tree').setup() end
}
use { "ryanoasis/vim-devicons" }
use { "kyazdani42/nvim-web-devicons" }
use { "akinsho/bufferline.nvim" }

-- Treesitter
use { "nvim-treesitter/nvim-treesitter" }
use { "lewis6991/spellsitter.nvim",
  config = function () require('spellsitter').setup() end
}

-- Tmux
use { "christoomey/vim-tmux-navigator" }

-- Git
use { "lewis6991/gitsigns.nvim" }
use {
  "sindrets/diffview.nvim",
  after = { "neogit" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  config = get_config("diffview")
}
use { "TimUntersberger/neogit",
  cmd = { "Neogit" },
  config = get_config("neogit")
}
use { "f-person/git-blame.nvim" }
use { "rhysd/committia.vim" }

-- LSP
use { "neovim/nvim-lspconfig" }
use { "williamboman/nvim-lsp-installer" }
use { "jose-elias-alvarez/null-ls.nvim" }
use { "nvim-lua/lsp-status.nvim" }
use { "folke/lua-dev.nvim" }
use { "ray-x/lsp_signature.nvim" }
use { "folke/trouble.nvim",
  cmd = { "Trouble" },
  -- keys = { "<leader>xx" },
  config = get_config("trouble")
}

-- Compe
use { "hrsh7th/nvim-cmp" }
use { "hrsh7th/cmp-nvim-lsp" }
use { "hrsh7th/cmp-buffer" }
use { "hrsh7th/cmp-path" }
use { "hrsh7th/cmp-cmdline" }
use { 'L3MON4D3/LuaSnip' }
use { 'saadparwaiz1/cmp_luasnip' }
use { "rafamadriz/friendly-snippets" }
use { "onsails/lspkind-nvim" }

-- Telescope
use { "nvim-telescope/telescope.nvim", config = get_config("telescope") }
use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

-- HTTP Client
use { "NTBBloodbath/rest.nvim" }

-- Markdown

-- Zen
use { "folke/zen-mode.nvim",
  as = "zen",
  cmd = "ZenMode",
  config = get_config("zen")
}
use { "folke/twilight.nvim",
  after = "zen",
  config = get_config("twilight")
}

-- Neorg
use {
    "nvim-neorg/neorg",
    ft = "norg",
    after = "nvim-treesitter", -- You may want to specify Telescope here as well
    config = function()
        require('neorg').setup {
        }
    end
}

-- SchemaStore
use { "b0o/schemastore.nvim" }

-- Theme
-- use { "doums/darcula" }
use { "sainnhe/gruvbox-material" }


