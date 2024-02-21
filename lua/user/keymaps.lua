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
vim.keymap.set("i", "<C-z>", ":undo<CR>")

-- close neovim
vim.keymap.set("n", "<C-q>", ":q<CR>")

-- redo
vim.keymap.set("n", "<C-y>", ":redo<CR>")
vim.keymap.set("i", "<C-y>", ":redo<CR>")

-- insert new line without entering insert mode
vim.keymap.set("n", "<leader>o", "o<Esc>", { silent = true, noremap = true })

-- close current buffer
vim.keymap.set("n", "<leader>c", ":BufferClose<CR>")

-- move to next buffer
-- vim.keymap.set("n", "<leader>l", ":BufferNext<CR>")

-- move to previous buffer
-- vim.keymap.set("n", "<leader>h", ":BufferPrevious<CR>")

-- reorder: move the buffer next
vim.keymap.set("n", "<leader>>", ":BufferMoveNext")

-- reorder: move the buffer previous
vim.keymap.set("n", "<leader><", ":BufferMovePrevious")

-- pin or unpin the current buffer
vim.keymap.set("n", "<leader>p", ":BufferPin<CR>")

-- close all buffer but current
vim.keymap.set("n", "<leader>q", ":BufferCloseAllButCurrent<CR>")

-- set kj to escape
vim.keymap.set("i", "kj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("v", "kj", "<Esc>", { noremap = true, silent = true })

-- move line up and down - vscode-like
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")     -- swap line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")     -- swap line down(n)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- swap line up(v)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- swap line down(v)
