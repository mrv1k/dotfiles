local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- vim.cmd("colorscheme tokyonight")
    -- vim.cmd('colorscheme gruvbox')
    -- vim.cmd('colorscheme rose-pine') this
    -- vim.cmd('colorscheme catppuccin')
    -- vim.cmd('colorscheme kanagawa')
    {
        'rose-pine/neovim',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        name = 'rose-pine',
        config = function()
            -- load the colorscheme here
            name = 'rose-pine' 
            vim.cmd([[colorscheme rose-pine]])
            vim.opt.background = "dark"
        end,
    },

    -- being good
    "ThePrimeagen/vim-be-good",

    -- improve navigation
    "tpope/vim-surround",
    "tpope/vim-commentary",
    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },


    -- {
    --     'nvim-treesitter/nvim-treesitter',
    --     dependencies = {
    --         'nvim-treesitter/nvim-treesitter-textobjects',
    --     },
    --     build = ':TSUpdate',
    -- },
-- require("lazy").setup()
    --     -- Highlight, edit, and navigate code
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

    -- "nvim-treesitter/playground",
    -- "neovim/nvim-lspconfig",

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            build = function() pcall(vim.cmd, 'MasonUpdate') end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
    }
},
})

