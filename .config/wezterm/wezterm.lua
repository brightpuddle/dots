local w = require("wezterm")
local c = require("colors")
require("tabs")

local config = w.config_builder()
-- function get_appearance()
-- 	if w.gui then
-- 		return w.gui.get_appearance()
-- 	end
-- 	return "Dark"
-- end
--
-- function scheme_for_appearance(appearance)
-- 	if appearance:find("Dark") then
-- 		return "nord"
-- 	else
-- 		return "nord_light"
-- 	end
-- end

-- Base UI
config.font = w.font("RobotoMono Nerd Font", { weight = "Medium" })
config.font_size = 15.0
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.line_height = 0.90
-- config.color_scheme = scheme_for_appearance(get_appearance())
config.color_scheme = "nord"
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.native_macos_fullscreen_mode = true
config.tab_max_width = 36
config.window_padding = {
	left = 8,
	right = 8,
	top = 0,
	bottom = 0,
}
config.window_frame = {
	active_titlebar_bg = c.bg,
	inactive_titlebar_bg = c.bg,
	font = w.font({ family = "Roboto Mono", weight = "Bold" }),
	font_size = 15.0,
}

config.check_for_updates = false

config.colors = {
	tab_bar = {
		background = c.bg,
		active_tab = {
			bg_color = c.active.bg,
			fg_color = c.active.fg,
		},
		inactive_tab = {
			bg_color = c.inactive.bg,
			fg_color = c.inactive.fg,
		},
	},
}
config.scrollback_lines = 3500
config.keys = require("keys")
-- config.unix_domains = {
-- 	{
-- 		name = "unix",
-- 	},
-- }
-- config.default_gui_startup_args = { "connect", "unix" }

return config
