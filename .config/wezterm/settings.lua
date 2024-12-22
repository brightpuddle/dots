local w = require("wezterm")
local c = require("colors")

return {
	font = w.font("Roboto Mono", { weight = "Medium" }),
	font_size = 15,
	color_scheme = "nord",
	command_palette_bg_color = c.nord1,
	command_palette_fg_color = c.fg,
	command_palette_rows = 10,
	command_palette_font_size = 15,
	default_workspace = "scratch  ",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	window_padding = {
		left = 8,
		right = 8,
		top = 8,
		bottom = 8,
	},
	window_frame = {
		active_titlebar_bg = c.bg,
		active_titlebar_fg = c.darker_fg,
		inactive_titlebar_bg = c.bg,
		font = w.font("Roboto Mono", { weight = "Bold" }),
		font_size = 15.0,
	},
	window_decorations = "RESIZE",
	native_macos_fullscreen_mode = true,
	unix_domains = {
		{ name = "unix" },
	},

	-- Global settings
	check_for_updates = false,
	audible_bell = "Disabled",
	scrollback_lines = 3500,
}
