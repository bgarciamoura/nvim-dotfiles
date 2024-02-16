local Plugin = { "edluffy/hologram.nvim" }

function Plugin.config()
	require("hologram").setup({
		-- auto_display = true,
	})
end

return Plugin

