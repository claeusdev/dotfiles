local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "tjdevries/colorbuddy.nvim"
  use "chriskempson/base16-vim"
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  } --statuline

  -- snipppets
  use "L3MON4D3/LuaSnip"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for neovim built-in lsp
  use "hrsh7th/nvim-cmp" -- completion
  use "hrsh7th/cmp-path"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use({ "glepnir/lspsaga.nvim", branch = "main" }
  )
  use "jose-elias-alvarez/typescript.nvim"
  use "onsails/lspkind-nvim" --- vscode-like pictograms

  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"

  use {
    "nvim-treesitter/nvim-treesitter", run = function ()
     require("nvim-treesitter.install").update({ with_sync = true }) 
    end
  }

  use "nvim-lua/plenary.nvim" -- Common Utilities
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  use "akinsho/nvim-bufferline.lua"
  use "norcalli/nvim-colorizer.lua"

  use { "iamcco/markdown-preview.nvim", run = 'cd app && yarn intall', cmd = "MarkdownPreview" }

  -- Ruby/Rails
  use "tpope/vim-bundler"
  use "tpope/vim-rails"
  use "tpope/vim-ragtag"
  use "tpope/vim-repeat"
  use "tpope/vim-endwise"
  use "tpope/vim-surround"

  -- Golang
  use "fatih/vim-go"

  -- Prettier && formating
  use "jose-elias-alvarez/null-ls.nvim"
  use "jayp0521/mason-null-ls.nvim"
  use "MunifTanjim/prettier.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "dinhhuy258/git.nvim"
  use 'tpope/vim-fugitive'

  -- Mason setup to get and install other lsp servers
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use "neovim/nvim-lspconfig" -- lsp

  -- Github co-pilot
  use "github/copilot.vim"

  -- tmux & split window navigation
  use "christoomey/vim-tmux-navigator"

  use "szw/vim-maximizer"
  use "vim-scripts/ReplaceWithRegister"

  -- comments
  use "numToStr/Comment.nvim"

  -- File Explorer
  use { "nvim-tree/nvim-tree.lua", requires = {
    'nvim-tree/nvim-web-devicons'
  }, tag = 'nightly' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
