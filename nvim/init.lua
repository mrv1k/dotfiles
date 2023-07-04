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
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.termguicolors = true

vim.opt.scrolloff = 20
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@") -- allow "@" in path, why? dunno but hey Prime does it

vim.opt.updatetime = 50
vim.opt.colorcolumn = "81"

--

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

require("plugins")
require("keys")

