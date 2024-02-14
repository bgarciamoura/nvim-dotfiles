local Plugin = { "windwp/nvim-autopairs" }

Plugin.event = "InsertEnter"

function Plugin.config()
	require("nvim-autopairs").setup({
		check_ts = true,
		enable_check_bracket_line = true,
		ignored_next_char = "[%w%.]",
		enable_moveright = true,
		enable_afterquote = true,
		enable_check_bracket_end = true,
		enable_insert = true,
		map_cr = false,
	})
end

return Plugin

