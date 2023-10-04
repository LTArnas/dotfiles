-- Important base shiz
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })

-- (Vim's) File Explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move lines
-- TODO: Does not work for the very bottom or top (error then quits visual mode.)
-- Maybe do a lua function?
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Modofy joinlines (J) to keep cursor in place.
vim.keymap.set("n", "J", "mzJ`z")
-- Modify page up/down scrolling to keep cursor in center.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Modify search next/back to keep current/cursor in the center.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keep pasting the same copy
vim.keymap.set("x", "<leader>p", '"_dP')

-- Keep seperate clipboards (vim vs system). Normal yanks are for vim, these are for the system.
vim.keymap.set("n", "<leader>P", '"+p')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("v", "<leader>y", '"+y')

-- TODO: Try quickfix
-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Find and replace:
-- <C-r><C-w> Takes the word under cursor and puts it in the cmd prompt where the cursor there is.
vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
