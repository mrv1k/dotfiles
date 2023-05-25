-- https://github.com/ThePrimeagen/.dotfiles/blob/6a8287fbb400511649da5867dd134074b8ecec52/nvim/.config/nvim/lua/theprimeagen/keymap.lua

local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

local nmap = bind("n", {noremap = false})
local nnoremap = bind("n")
local vnoremap = bind("v")
local xnoremap = bind("x")
local inoremap = bind("i")



-- vultured primegean config
nnoremap("<leader>pv", "<cmd>Ex<CR>")

-- [J]oin line without jumping cursor all the way to the right
-- move line
-- vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
-- join a line withou a space
nnoremap("J", "mzJ`z")

-- center when jumping around
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")


-- greatest remap ever
xnoremap("<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")



-- all grown up writing my own config
nnoremap(";", ":")

nnoremap("c", "\"_c")
vnoremap("c", "\"_c")

nnoremap("C", "\"_C")
vnoremap("C", "\"_C")


--[[
word word word word word word
word word word word word word
word word word word word word
word word word word word word
word word word word word word
--]]
