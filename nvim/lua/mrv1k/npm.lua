-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use("tpope/vim-surround")
  use("tpope/vim-commentary")
  use("tpope/vim-fugitive")


  use("ThePrimeagen/vim-be-good")

  -- autoclose {}

  -- theme
  use("folke/tokyonight.nvim")
  use("gruvbox-community/gruvbox")

  use("neovim/nvim-lspconfig")
end)

