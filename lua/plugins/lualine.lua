local Plugin = { "nvim-lualine/lualine.nvim" }

Plugin.event = "VeryLazy"

-- See :help lualine.txt
Plugin.opts = {
	options = {
		--theme = 'solarized_dark',
		--theme = 'nightfly',
		--theme = 'material',
		-- theme = "solarized_light",
		-- theme = "dracula",
		theme = "catppuccin",
		icons_enabled = true,
		component_separators = "|",
		section_separators = "",
		disabled_filetypes = {
			statusline = { "Neotree" },
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { "filename" },
		lualine_x = {
			function()
				local ok, pomo = pcall(require, "pomo")
				if not ok then
					return ""
				end

				local timer = pomo.get_first_to_finish()
				if timer == nil then
					return "󰄉 0:00"
				end

				return "󰄉 " .. tostring(timer)
			end,
			"encoding",
			"fileformat",
			"filetype",
			"lsp",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
}

function Plugin.setup()
	local lualine = require("lualine")
	lualine.setup(Plugin.opts)
end

function Plugin.init()
	vim.opt.showmode = false
end

return Plugin
