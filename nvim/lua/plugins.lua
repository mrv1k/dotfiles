-- How to convert plugsin to lazy.nvim
--
-- What's important for lazy loading is that you make sure that
-- the require is only called when you invoke the keymap, for example:
-- local set = vim.keymap.set
---- this require will be evaluated at startup time:
-- set('n', 'key', require('plugin').function)
---- this require is only evaluated when invoking the keymap since it's wrapped in a function:
-- set('n', 'key', function() require('plugin').function() end)

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

-- lazy-load on keys
-- mode is `n` by default. For more advanced options, check the section on key mappings
-- keys = { "<C-a>", { "<C-x>", mode = "n" } },

-- migrate to lazy https://www.youtube.com/watch?v=aqlxqpHs-aQ
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

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 269
        end,
        -- the rest of the config is at the bottom, mostly just prefix group names
    },

    -- PRIME TIME
    "ThePrimeagen/vim-be-good",
    {
        "ThePrimeagen/harpoon",
        -- try to keep it close to alphabetical order, that's how it's displayed in which-key
        keys = {
            { "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, desc = "toggle harpoon" },
            -- { "<leader>ht", function() require("harpoon.ui").toggle_quick_menu() end, desc = "[t]oggle quick menu" },

            { "<leader>ha", function() require("harpoon.mark").add_file() end, desc = "[a]dd" },
            { "<leader>hr", function() require("harpoon.mark").rm_file() end, desc = "[r]emove" },
            { "<leader>hn", function() require("harpoon.mark").nav_next() end, desc = "[n]ext" },
            { "<leader>hp", function() require("harpoon.mark").nav_prev() end, desc = "[p]revious" },
            { "<leader>hc", function() require("harpoon.mark").clear_all() end, desc = "[c]lear all" },

            { "<C-h>", function() require("harpoon.ui").nav_file(1) end },
            { "<C-j>", function() require("harpoon.ui").nav_file(2) end },
            { "<C-k>", function() require("harpoon.ui").nav_file(3) end },
            { "<C-l>", function() require("harpoon.ui").nav_file(4) end },
            { "<leader>h5", function() require("harpoon.ui").nav_file(5) end },
            { "<leader>h6", function() require("harpoon.ui").nav_file(6) end },
            { "<leader>h7", function() require("harpoon.ui").nav_file(7) end },
            { "<leader>h8", function() require("harpoon.ui").nav_file(8) end },
        },
    },

    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump({
                        search = {
                            mode = function(str)
                                return "\\<" .. str
                            end,
                        },
                    })                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "o", "x" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash",
            },
            {
                "R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Flash Treesitter Search",
            },
            {
                "<c-s>",
                mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search",
            },
        },
    },

    -- improve navigation
    "tpope/vim-surround",
    "tpope/vim-commentary",
    -- Git related plugins
    {
        'tpope/vim-fugitive',
        keys = {
            {'<leader>gs', '<cmd>Git<CR>', desc = 'git [s]tatus'},
        }

    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        config = function()
                local gitsigns = require('gitsigns')
                gitsigns.setup()
        end
    },
    'tpope/vim-rhubarb',
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    -- ctrl+z on steroids
    {
        'mbbill/undotree',
        keys = {
            { '<leader>u', '<cmd>UndotreeToggle<CR>', desc = "Toggle undotree" },
        }
    },


    -- Fuzzy Finder (files, lsp, etc)
    { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },

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
            "nvim-treesitter/playground"
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

    -- stolen from https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/guides/lazy-loading-with-lazy-nvim.md
    {
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v2.x',
            lazy = true,
            config = function()
                -- This is where you modify the settings for lsp-zero
                -- Note: autocompletion settings will not take effect

                -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#available-presets
                require('lsp-zero.settings').preset('recommended')
                -- default kbs
                -- <Ctrl-y>: Confirms selection.
                -- <Ctrl-e>: Cancel the completion.
                -- <Down>: Navigate to the next item on the list.
                -- <Up>: Navigate to previous item on the list.
                -- <Ctrl-n>: Go to the next item in the completion menu, or trigger completion menu.
                -- <Ctrl-p>: Go to the previous item in the completion menu, or trigger completion menu.
                -- <Ctrl-d>: Scroll down in the item's documentation.
                -- <Ctrl-u>: Scroll up in the item's documentation.

        end
    },

        -- Autocompletion
        {
            'hrsh7th/nvim-cmp',
            event = 'InsertEnter',
            dependencies = {
                {'L3MON4D3/LuaSnip'},
            },
            config = function()
                -- Here is where you configure the autocompletion settings.
                -- The arguments for .extend() have the same shape as `manage_nvim_cmp`: 
                -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

                require('lsp-zero.cmp').extend()

                -- And you can configure cmp even more, if you want to.
                local cmp = require('cmp')
                local cmp_action = require('lsp-zero.cmp').action()

                -- TODO: figure out what these keys do and add tab for autocomplete 
                cmp.setup({
                    mapping = {
                        -- `Enter` key to confirm completion
                        ['<CR>'] = cmp.mapping.confirm({select = false}),

                        -- Ctrl+Space to trigger completion menu
                        ['<C-Space>'] = cmp.mapping.complete(),

                        -- Navigate between snippet placeholder
                        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                        -- ['<C-enter>'] = cmp.mapping.complete(),
                        -- ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                        -- ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                    }
                })
            end
        },

        -- LSP
        --
        {
            'Shopify/ruby-lsp',
            name = 'ruby_lsp',
        },
        {
            'neovim/nvim-lspconfig',
            cmd = 'LspInfo',
            event = {'BufReadPre', 'BufNewFile'},
            dependencies = {
                {'hrsh7th/cmp-nvim-lsp'},
                {'williamboman/mason-lspconfig.nvim'},
                {
                    'williamboman/mason.nvim',
                    -- build = ":MasonUpdate" -- :MasonUpdate updates registry contents
                    build = function()
                        require('mason').setup()
                        -- return vim.fn.executable 'make' == 1
                    end,
                },
            },
            config = function()
                -- This is where all the LSP shenanigans will live
                require('mason').setup({ automatic_installation = true })

                local lsp = require('lsp-zero')
                lsp.ensure_installed({
                    'tsserver',
                    -- 'eslint',
                    -- 'prettier',
                    'lua_ls',
                    'ruby_ls'
                })


                lsp.on_attach(function(client, bufnr)
                    lsp.default_keymaps({buffer = bufnr})
                end)

                -- (Optional) Configure lua language server for neovim
                require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

                -- textDocument/diagnostic support until 0.10.0 is released
                _timers = {}
                local function setup_diagnostics(client, buffer)
                    if require("vim.lsp.diagnostic")._enable then
                        return
                    end

                    local diagnostic_handler = function()
                        local params = vim.lsp.util.make_text_document_params(buffer)
                        client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
                            if err then
                                local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
                                vim.lsp.log.error(err_msg)
                            end
                            local diagnostic_items = {}
                            if result then
                                diagnostic_items = result.items
                            end
                            vim.lsp.diagnostic.on_publish_diagnostics(
                            nil,
                            vim.tbl_extend("keep", params, { diagnostics = diagnostic_items }),
                            { client_id = client.id }
                            )
                        end)
                    end

                    diagnostic_handler() -- to request diagnostics on buffer when first attaching

                    vim.api.nvim_buf_attach(buffer, false, {
                        on_lines = function()
                            if _timers[buffer] then
                                vim.fn.timer_stop(_timers[buffer])
                            end
                            _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
                        end,
                        on_detach = function()
                            if _timers[buffer] then
                                vim.fn.timer_stop(_timers[buffer])
                            end
                        end,
                    })
                end

                require("lspconfig").ruby_ls.setup({
                    on_attach = function(client, buffer)
                        setup_diagnostics(client, buffer)
                    end,
                })

                lsp.setup()
            end
        }
    },
    {
        "williamboman/mason.nvim",
    }
})

local wk = require("which-key")
wk.register({
    ["<leader>"] = { h = { name = "[h]arpoon" }, },
})

-- Copypasta as per https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
--
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
vim.keymap.set('n', '<leader>p', require('telescope.builtin').find_files, { desc = '[P]earch files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

