local Plugin = { "terryma/vim-smooth-scroll" }

function Plugin.config()
	local keyOpts = { noremap = true, silent = true }
	vim.keymap.set("n", "<C-u>", "<cmd>:call smooth_scroll#up(&scroll, 0, 2)<CR>", keyOpts)
	vim.keymap.set("n", "<C-d>", "<cmd>:call smooth_scroll#down(&scroll, 0, 2)<CR>", keyOpts)
	vim.keymap.set("n", "<C-b>", "<cmd>:call smooth_scroll#up(&scroll*2, 0, 4)<CR>", keyOpts)
	vim.keymap.set("n", "<C-f>", "<cmd>:call smooth_scroll#down(&scroll*2, 0, 4)<CR>", keyOpts)
	vim.keymap.set("i", "<C-u>", "<cmd>:call smooth_scroll#up(&scroll, 0, 2)<CR>", keyOpts)
	vim.keymap.set("i", "<C-d>", "<cmd>:call smooth_scroll#down(&scroll, 0, 2)<CR>", keyOpts)
	vim.keymap.set("i", "<C-b>", "<cmd>:call smooth_scroll#up(&scroll*2, 0, 4)<CR>", keyOpts)
	vim.keymap.set("i", "<C-f>", "<cmd>:call smooth_scroll#down(&scroll*2, 0, 4)<CR>", keyOpts)
end

return Plugin
