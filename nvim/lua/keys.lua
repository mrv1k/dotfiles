-- initial based on Primegean vim config, do checkout hist YT vim setup tutorial
-- Use [[ ]] for raw strings, not escaping (instead of "")
--
-- To define a mapping which will not be echoed on the command line, add
-- "<silent>" as the first argument.
--
-- https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
-- n  Normal mode map. Defined using ':nmap' or ':nnoremap'.
-- i  Insert mode map. Defined using ':imap' or ':inoremap'.
-- v  Visual and select mode map. Defined using ':vmap' or ':vnoremap'.
-- x  Visual mode map. Defined using ':xmap' or ':xnoremap'.
-- s  Select mode map. Defined using ':smap' or ':snoremap'.
-- c  Command-line mode map. Defined using ':cmap' or ':cnoremap'.
-- o  Operator pending mode map. Defined using ':omap' or ':onoremap'.

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- open explorer vs-*bleep* style
vim.keymap.set("n", "<C-b>", vim.cmd.Ex)

-- move line with appropriate indentation
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- [J]oin line without jumping cursor all the way to the right
vim.keymap.set("n", "J", "mzJ`z")

-- center when jumping around
-- just bind it to 20j/k to avoid mucking with % compute 
vim.keymap.set("n", "<C-d>", "20jzz")
vim.keymap.set("n", "<C-u>", "20kzz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--There are 9 types of registers:			*registers* *E354*
-- 1. The unnamed register ""
-- 2. 10 numbered registers "0 to "9
-- 3. The small delete register "-
-- 4. 26 named registers "a to "z or "A to "Z
-- 5. four read-only registers ":, "., "% and "#
-- 6. the expression register "=
-- 7. The selection and drop registers "*, "+ and "~ 
-- 8. The black hole register "_
-- 9. Last search pattern register "/ -- useful for capture and replace

-- system clipboard
-- yank
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- paste
vim.keymap.set({"n", "v"}, "<leader>pv", [["+p]])
vim.keymap.set("n", "<leader>Pv", [["+P]])
vim.keymap.set("n", "<leader>PV", [["+P]])

-- skip buffer actions
vim.keymap.set("v", "<leader>p", [["_dP]]) -- paste
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]]) -- delete
-- don't yank on change
vim.keymap.set({"n", "v"}, "c", [["_c]])
vim.keymap.set({"n", "v"}, "C", [["_C]])

-- flash.nvim conflicting with this key
-- vim.keymap.set("n", ";", ":")

