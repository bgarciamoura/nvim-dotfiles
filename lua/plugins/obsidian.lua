local Plugin = { "epwalsh/obsidian.nvim" }

Plugin.version = "*"

Plugin.lazy = true
Plugin.ft = "markdown"
Plugin.dependencies = { "nvim-lua/plenary.nvim" }
Plugin.opts = {
	workspaces = {
		{
			name = "BG_vault",
			path = "/Users/macbookairm1/Library/Mobile Documents/iCloud~md~obsidian/Documents/BG_vault",
		},
	},
	notes_subdir = "notes",
	log_level = vim.log.levels.INFO,
	daily_notes = {
		folder = "notes/dailies",
		date_format = "%d-%m-%Y",
		template = "daily",
	},
	completion = {
		nvim_cmp = true,
		min_chars = 2,
	},
	mappings = {
		["<leader>ch"] = {
			action = function()
				return require("obsidian").util.toggle_checkbox()
			end,
			opts = { buffer = true },
		},
	},
	new_notes_location = "notes_subdir",
	-- Specify how to handle attachments.
	attachments = {
		-- The default folder to place images in via `:ObsidianPasteImg`.
		-- If this is a relative path it will be interpreted as relative to the vault root.
		-- You can always override this per image by passing a full path to the command instead of just a filename.
		img_folder = "assets/imgs", -- This is the default
		-- A function that determines the text to insert in the note when pasting an image.
		-- It takes two arguments, the `obsidian.Client` and a plenary `Path` to the image file.
		-- This is the default implementation.
		---@param client obsidian.Client
		---@param path Path the absolute path to the image file
		---@return string
		img_text_func = function(client, path)
			local link_path
			local vault_relative_path = client:vault_relative_path(path)
			if vault_relative_path ~= nil then
				-- Use relative path if the image is saved in the vault dir.
				link_path = vault_relative_path
			else
				-- Otherwise use the absolute path.
				link_path = tostring(path)
			end
			local display_name = vim.fs.basename(link_path)
			return string.format("![%s](%s)", display_name, link_path)
		end,
	},
}

function Plugin.setup()
	require("obsidian").setup({})
end

return Plugin
