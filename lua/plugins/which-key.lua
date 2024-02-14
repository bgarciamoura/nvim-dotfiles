local Plugin = { "folke/which-key.nvim" }

Plugin.event = "VeryLazy"

Plugin.opts = {
	plugins = {
		marks = true,   -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		presets = {
			operators = true, -- adds help for operators like d, y, ...
			motions = true,   -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true,   -- default bindings on <c-w>
			nav = true,       -- misc bindings to work with windows
			z = true,         -- bindings for folds, spelling and others prefixed with z
			g = true,         -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	motions = {
		count = true,
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "none",        -- none, single, double, shadow
		position = "bottom",    -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
		padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,           -- value between 0-100 0 for fully opaque and 100 for fully transparent
		zindex = 1000,          -- positive value to position WhichKey above other floating windows.
	},
	layout = {
		height = { min = 4, max = 25 },                                                -- min and max height of the columns
		width = { min = 20, max = 50 },                                                -- min and max width of the columns
		spacing = 3,                                                                   -- spacing between columns
		align = "left",                                                                -- align columns left, center or right
	},
	ignore_missing = false,                                                          -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
	show_help = true,                                                                -- show a help message in the command line for using WhichKey
	show_keys = true,                                                                -- show the currently pressed key and its label as a message in the command line
	triggers = "auto",                                                               -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specifiy a list manually
	-- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
	triggers_nowait = {
		-- marks
		"`",
		"'",
		"g`",
		"g'",
		-- registers
		'"',
		"<c-r>",
		-- spelling
		"z=",
	},
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for keymaps that start with a native binding
		i = { "j", "k" },
		v = { "j", "k" },
	},
	-- disable the WhichKey popup for certain buf types and file types.
	-- Disabled by default for Telescope
	disable = {
		buftypes = {},
		filetypes = {},
	},
}

function Plugin.init()
	vim.o.timeout = true
	vim.o.timeoutlen = 300
end

function Plugin.config()
	local wk = require("which-key")
	wk.register({
		["<leader>t"] = {
			name = "+Files",
			b = { "<cmd>Telescope buffers<CR>", "Find Buffers" },
			f = { "<cmd>Telescope find_files<CR>", "Find Files" },
			l = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
			h = { "<cmd>Telescope help_tags<CR>", "Find Help Tags" },
			m = { "<cmd>Telescope marks<CR>", "Find Marks" },
			r = { "<cmd>Telescope registers<CR>", "Find Registers" },
			s = { "<cmd>Telescope search_history<CR>", "Search History" },
			t = { "<cmd>Telescope tags<CR>", "Find Tags" },
			g = { "<cmd>Telescope git_files<CR>", "Find Git Files" },
		},
		["<leader>L"] = {
			name = "+Lazy.nvim",
			l = { "<cmd>Lazy<CR>", "Open Lazy.nvim interface" },
			c = { "<cmd>Lazy check<CR>", "Check for updates and show the log" },
			x = { "<cmd>Lazy clean<CR>", "Clean plugins that are no longer needed" },
			s = { "<cmd>Lazy sync<CR>", "Run install, clean and update" },
			u = { "<cmd>Lazy update<CR>", "Update plugins. This also update the lockfile" },
		},
		["<leader>N"] = {
			name = "+NeoTree",
			t = { "<cmd>Neotree toggle<CR>", "Toggle the NeoTree panel" },
		},
		["<leader>M"] = {
			name = "+Mason",
			m = { "<cmd>Mason<CR>", "Shows Mason panel" },
		},
		["<leader>O"] = {
			name = "+None_LS",
			f = { "Format document using prettier using <leader>lf" },
		},
		["<leader>C"] = {
			name = "+CMP",
			K = { "<cmd>lua =vim.lsp.buf.hover()<CR>", "CMP Hover" },
			g = { "<cmd>lua =vim.lsp.buf.definition()<CR>", "CMP Go to Definition" },
			r = { "<cmd>lua =vim.lsp.buf.references()<CR>", "CMP References" },
			s = { "<cmd>lua =vim.lsp.buf.signature_help()<CR>", "CMP Signature Help" },
			o = { "<cmd>lua =vim.lsp.buf.type_definition()<CR>", "CMP Type Definition" },
			i = { "<cmd>lua =vim.lsp.buf.implementation()<CR>", "CMP Implementation" },
			d = { "<cmd>lua =vim.lsp.diagnostic.show_line_diagnostics()<CR>", "CMP Show Line Diagnostics" },
			["[d"] = { "<cmd>lua =vim.lsp.diagnostic.goto_prev()<CR>", "CMP Go to Previous Diagnostic" },
			["]d"] = { "<cmd>lua =vim.lsp.diagnostic.goto_next()<CR>", "CMP Go to Next Diagnostic" },
			["<F4>"] = { "<cmd>lua =vim.lsp.buf.code_action()<CR>", "CMP Code Action" },
			["<F2>"] = { "<cmd>lua =vim.lsp.buf.rename()<CR>", "CMP Rename" },
			["<F3>"] = { "<cmd>lua =vim.lsp.buf.format()<CR>", "CMP Formatting" },
		},
		["<leader>E"] = {
			name = "+Emmet",
			e = { "<Plug>(emmet-expand-abbr)", "Emmet autocomplete" },
			E = { "<Plug>(emmet-expand-line)", "Emmet expand line" },
		},
	})
end

return Plugin

