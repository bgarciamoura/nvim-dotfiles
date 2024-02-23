local function buttonsSection(dashboard)
	return {
		dashboard.button("e", "  New File", ":enew<CR>"),
		dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
		dashboard.button("r", "  Recents", ":Telescope oldfiles<CR>"),
		dashboard.button("w", "  Find Word", "<CR>Telescope live_grep<CR>"),
		dashboard.button("b", "  Bookmarks", ":Telescope marks<CR>"),
		dashboard.button("l", "  Load Last Session", ":SessionLoad<CR>"),
		dashboard.button("s", "  Save Session", ":SessionSave<CR>"),
		dashboard.button("q", "  Quit", ":qa<CR>"),
	}
end

return buttonsSection
