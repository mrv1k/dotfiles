vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- https://neovim.io/doc/user/lua.html#:~:text=LUA%2DVIMSCRIPT%20BRIDGE
-- let g:netrw_list_hide= '.DS_Store'
vim.g.netrw_list_hide = '.DS_Store'
vim.g.netrw_liststyle = 3 -- Tree-style view
-- This setting tells vim whether to display hidden files by default.
-- vim.g.NERDTreeShowHidden = 0 -- hide hidden files :-/

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.smartindent = true
vim.opt.wrap = false


require("plugins")
require("keys")

