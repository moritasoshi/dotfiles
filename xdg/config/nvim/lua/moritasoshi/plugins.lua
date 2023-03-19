local get_config = function(name)
  return string.format('require("moritasoshi.config.%s")', name)
end
local m = {
  dap_disabled = true,
}
local plugins = {
  ["wbthomason/packer.nvim"] = {},

  -- Theme
  ["sainnhe/gruvbox-material"] = { config = get_config("gruvbox-material") },

  -- Text manipulation
  -- ["tpope/vim-abolish"] = {},
  -- ["haya14busa/vim-asterisk"] = {},
  ["godlygeek/tabular"] = {
    cmd = "Tabularize",
    config = get_config("tabular"),
  },
  ["ntpeters/vim-better-whitespace"] = { event = { "InsertLeave", "TextChanged" } },
  ["tpope/vim-repeat"] = {},
  ["tpope/vim-speeddating"] = {},
  ["tpope/vim-surround"] = {},
  ["abecodes/tabout.nvim"] = { config = get_config("tabout") },
  ["kevinhwang91/nvim-hlslens"] = { config = get_config("hlslens") },
  ["lukas-reineke/indent-blankline.nvim"] = {
    config = get_config("indentline"),
    event = "VimEnter",
  },
  ["numToStr/Comment.nvim"] = { config = get_config("comment") },
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
  ["lewis6991/impatient.nvim"] = {},

  -- UI & Interface
  ["akinsho/bufferline.nvim"] = { config = get_config("bufferline") },
  ["goolord/alpha-nvim"] = { config = get_config("alpha") },

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

  -- Notification
  ["rcarriga/nvim-notify"] = { config = get_config("notify") },

  -- Treesitter
  ["nvim-treesitter/nvim-treesitter"] = {
    config = get_config("treesitter"),
    run = ":TSUpdate",
  },
  ["nvim-treesitter/nvim-treesitter-textobjects"] = {},
  ["JoosepAlviste/nvim-ts-context-commentstring"] = { after = "nvim-treesitter" },
  ["p00f/nvim-ts-rainbow"] = { after = "nvim-treesitter" },
  ["windwp/nvim-ts-autotag"] = {
    after = "nvim-treesitter",
    ft = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
  },

  -- Git
  -- ["f-person/git-blame.nvim"] = {},
  ["TimUntersberger/neogit"] = { cmd = { "Neogit" }, config = get_config("neogit") },
  ["akinsho/git-conflict.nvim"] = { tag = "*", config = get_config("git-conflict") },
  ["lewis6991/gitsigns.nvim"] = {
    config = get_config("gitsigns"),
    setup = function()
      moriso.packer_lazy_load("gitsigns.nvim")
    end,
  },
  ["rhysd/committia.vim"] = {},

  -- LSP
  ["williamboman/mason.nvim"] = { config = get_config("lsp") },
  ["williamboman/mason-lspconfig.nvim"] = {},

  ["neovim/nvim-lspconfig"] = {},
  ["b0o/schemastore.nvim"] = {},
  ["folke/neodev.nvim"] = {},
  ["j-hui/fidget.nvim"] = { config = get_config("fidget") },
  ["jose-elias-alvarez/null-ls.nvim"] = { config = get_config("lsp.null-ls") }, -- run "brew install stylua"
  ["folke/trouble.nvim"] = { cmd = { "TroubleToggle" }, config = get_config("trouble") },

  -- Debug Adapter
  ["mfussenegger/nvim-dap"] = { disable = m.dap_disabled, config = get_config("dap/nvim-dap") },
  ["rcarriga/nvim-dap-ui"] = { disable = m.dap_disabled, config = get_config("dap/dapui") },
  ["theHamsta/nvim-dap-virtual-text"] = { disable = m.dap_disabled, config = get_config("dap/nvim-dap-virtual-text") },
  ["leoluz/nvim-dap-go"] = { disable = m.dap_disabled, config = get_config("dap/dap-go") },

  -- Go Development
  ["ray-x/go.nvim"] = { config = get_config("go") },
  ["ray-x/guihua.lua"] = {},
  ["ray-x/navigator.lua"] = {
    requires = {
      { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
      { "neovim/nvim-lspconfig" },
    },
  },

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

  -- Tmux
  ["christoomey/vim-tmux-navigator"] = {},

  -- Optional (Trial)
  ["tyru/open-browser.vim"] = {
    event = "VimEnter",
    config = function()
      moriso.map("n", "<Leader>rj", "<Plug>(openbrowser-smart-search)")
    end,
  },
}

require("core.packer").run(plugins)
