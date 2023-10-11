-- this file is used for vim configs

-- See `:help vim.o`
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

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- Save undo history
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.smartcase = true
-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = true

vim.opt.scrolloff = 20
-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@") -- allow "@" in path, why? dunno but hey Prime does it

-- Decrease update time
vim.opt.updatetime = 150
vim.o.timeoutlen = 300
vim.opt.colorcolumn = "81"

-- Enable break indent
vim.o.breakindent = true
-- Set completeopt to have a better completion experience
-- The completion menu is controlled by completeopt. 
vim.o.completeopt = 'menuone,noselect'

-- :h lua-high
local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd
au('TextYankPost', {
  group = ag('yank_highlight', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup='IncSearch', timeout=100 }
  end,
})

require("kickstart")

