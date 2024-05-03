local w = require("wezterm")

local c = require("colors")

-- require("tabs")

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

return {
	font = w.font("RobotoMono Nerd Font", { weight = "Medium" }),
	font_size = 15.0,
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	line_height = 0.90,
	-- color_scheme = scheme_for_appearance(get_appearance()),
	color_scheme = "nord",
	check_for_updates = false,
	window_decorations = "RESIZE",
	native_macos_fullscreen_mode = true,
	disable_default_key_bindings = true,
	show_tabs_in_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	tab_max_width = 32,
	-- default_prog = { "zsh", "-c", "tmux" },
	window_padding = {
		left = 8,
		right = 8,
		top = 8,
		bottom = 8,
	},
	window_frame = {
		active_titlebar_bg = c.bg,
		inactive_titlebar_bg = c.bg,
		font = w.font({ family = "Roboto Mono", weight = "Bold" }),
		font_size = 14.0,
	},
	colors = {
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
	},
	scrollback_lines = 3500,
	keys = require("keys"),
}
