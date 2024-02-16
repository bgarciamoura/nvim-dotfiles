local Plugin = { "nvim-neotest/neotest" }

function Plugin.config()
	require("neotest").setup({
		requires = {
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-jest",
		},
		adapters = {
			-- require("neotest-vitest"),
			require("neotest-jest")({
				jestCommand = "npm test --",
				--jestCommand = require("neotest-jest.jest-util").getJestCommand(vim.fn.expand("%:p:h")) .. " --watch",
				jestFilePattern = ".*\\.(test,tests,spec,specs)\\.(js,ts)$",
				cwd = function(path)
					return vim.fn.getcwd()
				end,
			}),
		},
	})
	vim.api.nvim_set_keymap(
		"n",
		"<leader>tw",
		"<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
		{}
	)
end

return Plugin

