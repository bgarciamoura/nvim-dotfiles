local Plugin = { "nvimtools/none-ls.nvim" }

function Plugin.config()
	local null_ls = require("null-ls")
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.prettier.with({
				filetypes = {
					"javascript",
					"typescript",
					"json",
					"yaml",
					"markdown",
					"html",
					"css",
					"scss",
					"less",
					"vue",
					"typescriptreact",
					"javascriptreact",
				},
			}),
			null_ls.builtins.formatting.stylua,
		},
	})

	vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
end

return Plugin

