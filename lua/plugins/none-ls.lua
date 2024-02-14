local Plugin = { "nvimtools/none-ls.nvim" }

function Plugin.config()
	local null_ls = require("null-ls")
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.prettier,
			null_ls.builtins.formatting.stylua,
		},
	})

	vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
end

return Plugin

