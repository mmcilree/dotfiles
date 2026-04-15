-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.initial_cols = 205
config.initial_rows = 100
config.font_size = 18
config.window_decorations = "RESIZE"
config.color_scheme = "Tokyo Night"
config.window_background_opacity = 0.95
config.font = wezterm.font("Menlo")
config.default_prog = { "/opt/homebrew/bin/fish" }
config.hide_tab_bar_if_only_one_tab = true
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true
config.keys = {
	{ mods = "ALT", key = "Backspace", action = wezterm.action.SendKey({ mods = "CTRL", key = "w" }) },
	{
		key = "t",
		mods = "CMD",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{ key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action.MoveTabRelative(-1) },
	{ key = "Tab", mods = "CTRL", action = wezterm.action.MoveTabRelative(1) },
}

return config
