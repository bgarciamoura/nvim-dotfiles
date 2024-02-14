local Plugin = { "zbirenbaum/copilot.lua" }

Plugin.cmd = "Copilot"

Plugin.event = "InsertEnter"

function Plugin.config()
	local copilot = require("copilot")

	copilot.setup({
		panel = {
			enabled = true,
			auto_refresh = false,
			keymap = {
				jump_prev = "[[",
				jump_next = "]]",
				accept = "<CR>",
				refresh = "gr",
				open = "<M-CR>",
			},
			layout = {
				position = "bottom", -- | top | left | right
				ratio = 0.4,
			},
		},
		suggestion = {
			enabled = true,
			auto_trigger = true,
			debounce = 75,
			keymap = {
				accept = "<C-f>",
				accept_word = false,
				accept_line = false,
				next = "<M-]>",
				prev = "<M-[>",
				dismiss = "<C-]>",
			},
		},
		filetypes = {
			yaml = false,
			markdown = false,
			help = false,
			gitcommit = false,
			gitrebase = false,
			hgcommit = false,
			svn = false,
			cvs = false,
			["."] = false,
		},
		copilot_node_command = "node", -- Node.js version must be > 18.x
		server_opts_overrides = {},
	})

	--vim.g.copilot_no_tab_map = true

	--vim.api.nvim_set_keymap('i', '<C-f>', 'copilot#Accept()', { noremap = true, silent = true, expr = true });

	--vim.api.nvim_set_keymap('i', '<C->>', 'copilot#Next()', { noremap = true, silent = true, expr = true });

	--vim.api.nvim_set_keymap('i', '<C-<>', 'copilot#Prev()', { noremap = true, silent = true, expr = true });
end

return Plugin

