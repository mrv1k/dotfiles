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

    -- Fuzzy Finder (files, lsp, etc)
    { 'nvim-telescope/telescope.nvim', tag = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },


    -- Highlight, edit, and navigate code
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn't work on Windows
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            -- "nvim-treesitter/playground"
        },
        build = ":TSUpdate", 
        keys = {
            { "<c-space>", desc = "Increment selection" },
            { "<bs>", desc = "Decrement selection", mode = "x" },
        },
        opts = {
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            sync_install = false,
            auto_install = true,
            ensure_installed = {
                "bash",
                "c",
                "html",
                "javascript",
                "json",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "typescript",
                "tsx",
                "vim",
                "vimdoc",
                "yaml",
            },
            -- incremental_selection = {
            --     enable = true,
            --     keymaps = {
            --         init_selection = "<C-space>",
            --         node_incremental = "<C-space>",
            --         scope_incremental = false,
            --         node_decremental = "<bs>",
            --     },
            -- },
        },
    },
    {
        -- local lsp = require('lsp-zero').preset('recommended')


        -- lsp.ensure_installed({
        --   'tsserver',
        -- -- typescript
        -- })

        -- lsp.on_attach(function(client, bufnr)
        --   lsp.default_keymaps({buffer = bufnr})
        -- end)

        -- -- (Optional) Configure lua language server for neovim
        -- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        -- lsp.setup()

        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim', build = function() pcall(vim.cmd, 'MasonUpdate') end, -- Optional
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
    }
},
})


-- What's important for lazy loading is that you make sure that
-- the require is only called when you invoke the keymap, for example:
-- local set = vim.keymap.set
---- this require will be evaluated at startup time:
-- set('n', 'key', require('plugin').function)
---- this require is only evaluated when invoking the keymap since it's wrapped in a function:
-- set('n', 'key', function() require('plugin').function() end)


-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')


-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
-- vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>pf', require('telescope.builtin').find_files, { desc = '[P]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })


