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
end)
