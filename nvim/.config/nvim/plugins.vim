""" Plugins  -------------------------------
call plug#begin('~/.local/share/nvim/plugged')
  Plug 'dkarter/bullets.vim'
  Plug 'cohama/lexima.vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-speeddating'
  Plug 'junegunn/vim-easy-align'
  Plug 'jghauser/mkdir.nvim'
  Plug 'tpope/vim-abolish'

  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'numToStr/Comment.nvim'
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'yuttie/comfortable-motion.vim'
  Plug 'editorconfig/editorconfig-vim'

  Plug 'lewis6991/impatient.nvim'
  Plug 'dstein64/vim-startuptime'

" Fancy
  Plug 'goolord/alpha-nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-tree.lua', { 'commit': '3f4ed9b6c2598ab8304186486a05ae7a328b8d49' }
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'

" Zen
  Plug 'folke/zen-mode.nvim'
  Plug 'folke/twilight.nvim'

" Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'lewis6991/spellsitter.nvim'

" Tmux
  Plug 'christoomey/vim-tmux-navigator'

" Git
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'TimUntersberger/neogit'

" LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'tami5/lspsaga.nvim'
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'nvim-lua/lsp-status.nvim'
  Plug 'folke/lua-dev.nvim'

" Compe
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'rafamadriz/friendly-snippets'

" Telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

" HTTP Client
  Plug 'NTBBloodbath/rest.nvim'

" Markdown

" Theme
  Plug 'doums/darcula'
  Plug 'morhetz/gruvbox'
  Plug 'sainnhe/gruvbox-material'


call plug#end()

