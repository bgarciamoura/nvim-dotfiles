-- set leader key to space
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>")

-- change the k for j to move up and down
vim.keymap.set("n", "k", "j")

-- change the j for k to move up and down
vim.keymap.set("n", "j", "k")

-- move cursor to the left window
vim.keymap.set("n", "<C-h>", "<C-W>h")

-- move cursor to the right window
vim.keymap.set("n", "<C-l>", "<C-W>l")

-- move cursor to the top window
vim.keymap.set("n", "<C-j>", "<C-W>k")

-- move cursor to the bottom window
vim.keymap.set("n", "<C-k>", "<C-W>j")

-- close all windows except the active one
vim.keymap.set("n", "<C-o>", "<C-W>o")

-- move the windows upwards/leftwards
vim.keymap.set("n", "<C-r>", "<C-W>R")

-- decrease current window width
vim.keymap.set("n", "<M-Left>", "<C-W><")

-- increase current window width
vim.keymap.set("n", "<M-Right>", "<C-W>>")

-- decrease current window height
vim.keymap.set("n", "<M-Down>", "<C-W>-")

-- increase current window height
vim.keymap.set("n", "<M-Up>", "<C-W>+")

-- save file with control+s
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>")

-- select all text in current buffer
vim.keymap.set("n", "<C-a>", ":keepjumps normal! ggVG<cr>")

-- undo
vim.keymap.set("n", "<C-z>", ":undo<CR>")

-- redo
vim.keymap.set("n", "<C-y>", ":redo<CR>")

-- close current buffer
vim.keymap.set("n", "<leader>c", ":BufferClose<CR>")

-- move to next buffer
vim.keymap.set("n", "<leader>l", ":BufferNext<CR>")

-- move to previous buffer
vim.keymap.set("n", "<leader>h", ":BufferPrevious<CR>")

-- reorder: move the buffer next
vim.keymap.set("n", "<leader>>", ":BufferMoveNext")

-- reorder: move the buffer previous
vim.keymap.set("n", "<leader><", ":BufferMovePrevious")

-- pin or unpin the current buffer
vim.keymap.set("n", "<leader>p", ":BufferPin<CR>")

-- close all buffer but current
vim.keymap.set("n", "<leader>q", ":BufferCloseAllButCurrent<CR>")

