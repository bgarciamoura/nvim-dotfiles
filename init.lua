-- function to auto require some modules
local load = function(mod)
	package.loaded[mod] = nil
	require(mod)
end

load("user.commands")
load("user.keymaps")

require("user.plugins")

pcall(vim.cmd.colorscheme, "catppuccin")
