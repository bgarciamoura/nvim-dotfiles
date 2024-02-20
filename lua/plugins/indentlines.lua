local Plugin = { "lukas-reineke/indent-blankline.nvim" }

Plugin.main = "ibl"

Plugin.opts = {}

function Plugin.config()
	require("ibl").setup(Plugin.opts)
end

return Plugin
