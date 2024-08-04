vim.g.mapleader = " "

-- opens the file tree (netrw)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move highlighted up and down (vscode alt up and down equivalent)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- move the line below to the end of the current line, keeping the cursor at the start
vim.keymap.set("n", "J", "mzJ`z")

-- scroll the file up and down keeping the cursor on the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- During search, keep the cursor in the middle of the page
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- when highlighting something to paste what's in the buffer over, keeps the
-- buffer instead of overwriting with the replaced thing
vim.keymap.set("x", "<leader>p", "\"_dP")

-- yank to the system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- deleting to void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- when something is highlighted, <leader>s will make a global replace in that string
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
