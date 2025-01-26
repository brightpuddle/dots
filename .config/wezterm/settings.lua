local w = require("wezterm")
local c = require("colors")
local util = require("util")

local schemes = {
	light = "zenbones_light",
	dark = "nord",
}

local light_scheme = w.get_builtin_color_schemes()[schemes.light]
light_scheme.background = "#fdfdfd"
light_scheme.ansi[1] = "#fdfdfd"

local dark_scheme = w.get_builtin_color_schemes()[schemes.dark]

return {
	font = w.font("RobotoMono Nerd Font", { weight = "DemiBold" }),
	font_size = 15,
	color_scheme = util.scheme_for_appearance(util.get_appearance(), schemes),
	color_schemes = {
		zenbones_light = light_scheme,
		nord = dark_scheme,
	},
	command_palette_bg_color = c.surface1,
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
		active_titlebar_bg = c.surface0,
		active_titlebar_fg = c.text0,
		inactive_titlebar_bg = c.surface0,
		inactive_titlebar_fg = c.text0,
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
