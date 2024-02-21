local Plugin = { "lukas-reineke/indent-blankline.nvim" }

Plugin.main = "ibl"

Plugin.opts = {
	indent = { highlight = "VertSplit", char = "│" },
}

function Plugin.config()
	require("ibl").setup(Plugin.opts)
end

return Plugin
