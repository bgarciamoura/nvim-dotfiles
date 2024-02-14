local Plugin = { "mattn/emmet-vim" }

function Plugin.config()
	vim.g.user_emmet_install_global = 0
	-- set emmet to run only in html, css, scss, xml, tsx, jsx
	vim.api.nvim_exec(
		[[
		autocmd FileType html,css,scss,xml,tsx,jsx let b:emmet_install_global = 0
	]],
		false
	)

	-- set emmet to complete with ctrl-y only

	vim.keymap.set("i", "<C-e>", "<Plug>(emmet-expand-abbr)", { noremap = true, silent = true })
end

return Plugin

