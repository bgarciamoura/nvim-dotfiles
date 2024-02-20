local Plugin = { "epwalsh/pomo.nvim" }

Plugin.version = "*"

Plugin.lazy = false

Plugin.cmd = { "TimerStart", "TimerRepeat" }

Plugin.dependencies = {}

Plugin.opts = {
	notifiers = {
		{
			name = "System",
		},
	},
	timers = {
		Pomodoro = {
			{
				name = "System",
				opt = {
					sticky = false,
				},
			},
		},
		ShortBreak = {
			{
				name = "System",
				opt = {
					sticky = false,
				},
			},
		},
		LongBreak = {
			{
				name = "System",
				opt = {
					sticky = false,
				},
			},
		},
	},
}

return Plugin
