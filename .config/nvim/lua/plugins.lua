local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "L3MON4D3/LuaSnip"
  use {
    "svrana/neosolarized.nvim",
    requires = { "tjdevries/colorbuddy.nvim" }
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  } --statuline
  use "onsails/lspkind-nvim" --- vscode-like pictograms
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for neovim built-in lsp
  use "hrsh7th/nvim-cmp" -- completion
  use "neovim/nvim-lspconfig" -- lsp
  use {
    "nvim-treesitter/nvim-treesitter", run = ":TSUpdate"
  }
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"

  use "nvim-lua/plenary.nvim" -- Common Utilities
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  use "akinsho/nvim-bufferline.lua"
  use "norcalli/nvim-colorizer.lua"

  use "glepnir/lspsaga.nvim"
  use { "iamcco/markdown-preview.nvim", run = 'cd app && yarn intall', cmd = "MarkdownPreview" }

  -- Ruby/Rails
  use "tpope/vim-bundler"
  use "tpope/vim-rails"
  use "tpope/vim-ragtag"
  use "tpope/vim-repeat"
  use "tpope/vim-endwise"

  -- Golang
  use "fatih/vim-go"

  -- Prettier
  use "jose-elias-alvarez/null-ls.nvim"
  use "MunifTanjim/prettier.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "dinhhuy258/git.nvim"

  -- Mason setup to get and install other lsp servers
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
end)
