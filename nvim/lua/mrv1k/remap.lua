local Remap = require("mrv1k.primeremaputil")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap



-- vultured primegean config
nnoremap("<leader>pv", "<cmd>Ex<CR>")

-- remap j to gj? so it doesn't unwrap wrapped code
-- move line
vnoremap("J", ":m '>+1<CR>gv=gv")
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


--
--
--
--

--[[
word word word word word word
word word word word word word
word word word word word word
word word word word word word
word word word word word word
--]]
