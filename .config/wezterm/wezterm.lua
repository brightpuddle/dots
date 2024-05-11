local w = require("wezterm")
local c = require("colors")

local config = w.config_builder()

local function get_appearance()
	if w.gui then
		return w.gui.get_appearance()
	end
	return "Dark"
end

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "nord"
	else
		return "nord"
	end
end

config.font = w.font("RobotoMono Nerd Font", { weight = "Medium" })
config.font_size = 15.0
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.line_height = 0.90
config.color_scheme = scheme_for_appearance(get_appearance())
config.check_for_updates = false
config.window_decorations = "RESIZE"
config.native_macos_fullscreen_mode = true
config.disable_default_key_bindings = true
config.show_tabs_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 32
config.default_prog = { "zsh", "-c", "tmux" }
config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}
config.window_frame = {
	active_titlebar_bg = c.bg,
	inactive_titlebar_bg = c.bg,
	font = w.font({ family = "Roboto Mono", weight = "Bold" }),
	font_size = 14.0,
}
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

return config
