local w = require("wezterm")

return {
	-- Font
	font = w.font("RobotoMono Nerd Font", { weight = "Medium" }),
	font_size = 15.0,
	-- cell_width = 1,
	line_height = 1.1,
	--
	color_scheme = "nord",
	window_decorations = "RESIZE",
	debug_key_events = true,
	window_padding = {
		left = 8,
		right = 8,
		top = 4,
		bottom = 4,
	},
	hide_tab_bar_if_only_one_tab = true,
	window_frame = {
		active_titlebar_bg = "#191c23",
		inactive_titlebar_bg = "#191c23",
	},
	colors = {
		tab_bar = {
			active_tab = {
				bg_color = "#2e3440",
				fg_color = "#d8dee9",
			},
			inactive_tab = {
				bg_color = "#222730",
				fg_color = "#616e88",
			},
		},
	},
	scrollback_lines = 3500,
	keys = require("keys"),
}
