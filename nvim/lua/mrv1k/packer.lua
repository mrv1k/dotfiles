return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
end)


[[
return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  use('tpope/vim-surround')
  use('tpope/vim-commentary')
  use('tpope/vim-fugitive')

  -- autoclose {}

  -- theme
  use('folke/tokyonight.nvim')
  use("gruvbox-community/gruvbox")
end)
]]
