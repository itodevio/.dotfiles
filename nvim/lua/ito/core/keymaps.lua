vim.g.mapleader = " "

local keymap = vim.keymap

-- Move highlighted up and down (vscode alt up and down equivalent)
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move the line below to the end of the current line, keeping the cursor at the start
keymap.set("n", "J", "mzJ`z")

-- Scroll the file up and down keeping the cursor on the middle
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Split Windows
keymap.set("n", "<leader>h", "<C-w>v") -- split vertically
keymap.set("n", "<leader>v", "<C-w>s") -- split horizontally
keymap.set("n", "<leader>c", ":close<CR>") -- close current split window
keymap.set("n", "<leader>=", "<C-w>=") -- make split windows equal size
keymap.set("n", "<leader>z", ":MaximizerToggle<CR>") -- toggle split window full screen

-- During search, keep the cursor in the middle of the page
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- When highlighting something to paste what's in the buffer over, keeps the
-- buffer instead of overwriting with the replaced thing
keymap.set("v", "<leader>p", "\"_dP")

-- Deleting to void register
keymap.set("n", "<leader>x", "\"_x")
keymap.set("n", "<leader>d", "\"_d")
keymap.set("v", "<leader>d", "\"_d")

-- In normal mode, <leader>s will make a global replace in the string below the cursor
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

