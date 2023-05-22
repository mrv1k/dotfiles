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

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }
  use('nvim-treesitter/playground')


  use("neovim/nvim-lspconfig")

  -- theme
  use("folke/tokyonight.nvim")
  use("gruvbox-community/gruvbox")
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use { "catppuccin/nvim", as = "catppuccin" }
  use "rebelot/kanagawa.nvim"
  use "EdenEast/nightfox.nvim"
  use "projekt0n/github-nvim-theme"
  use "sainnhe/everforest"

  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {                                      -- Optional
          'williamboman/mason.nvim',
          run = function()
              pcall(vim.cmd, 'MasonUpdate')
          end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
  }
}
end)

-- Not an editor command: TSUpdate
