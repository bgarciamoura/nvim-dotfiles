local Plugin = { "stevearc/conform.nvim" }

function Plugin.config()
	require("conform").setup({
		-- The default settings are shown below
		-- severity_sort = true,
		-- float = {
		-- 	border = "rounded",
		-- 	source = "always",
		-- },
		-- update_in_insert = true,
		formatters_by_ft = {
			javascript = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
			json = { { "prettierd", "prettier" } },
			yaml = { { "prettierd", "prettier" } },
			markdown = { { "prettierd", "prettier" } },
			html = { { "prettierd", "prettier" } },
			css = { { "prettierd", "prettier" } },
			scss = { { "prettierd", "prettier" } },
			less = { { "prettierd", "prettier" } },
			vue = { { "prettierd", "prettier" } },
			typescriptreact = { { "prettierd", "prettier" } },
			javascriptreact = { { "prettierd", "prettier" } },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	})

	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function(args)
			require("conform").format({ bufnr = args.buf })
		end,
	})
end

return Plugin
