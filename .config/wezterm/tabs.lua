local w = require("wezterm")
local c = require("colors")
local sep = {
	left = "",
	right = "",
}

local titlebar_bg = c.surface0

-- tab, tabs, panes, config, hover, max_width
w.on("format-tab-title", function(tab, _, _, _, _, max_width)
	local title = string.gmatch(tab.active_pane.title, "([^/]+)$")()
	local width = max_width - 9
	if #title > width then
		title = string.sub(title, #title - width, #title)
	end
	local fg
	local bg
	local icon
	if tab.is_active then
		fg = c.text1
		bg = c.surface1
		icon = "  "
	else
		fg = c.text1
		bg = c.bg
		icon = "  "
	end
	return {
		{ Background = { Color = titlebar_bg } },
		{ Text = " " },
		{ Background = { Color = titlebar_bg } },
		{ Foreground = { Color = bg } },
		{ Text = sep.left },
		{ Background = { Color = bg } },
		{ Foreground = { Color = c.water } },
		{ Text = icon },
		{ Foreground = { Color = fg } },
		{ Text = " " .. title .. " " },
		{ Background = { Color = titlebar_bg } },
		{ Foreground = { Color = bg } },
		{ Text = sep.right },
		{ Background = { Color = titlebar_bg } },
		{ Text = " " },
	}
end)

return {
	tab_max_width = 32,
	show_tabs_in_tab_bar = true,
	show_new_tab_button_in_tab_bar = false,
	show_close_tab_button_in_tabs = false,
	hide_tab_bar_if_only_one_tab = false,
	colors = {
		tab_bar = {
			inactive_tab_edge = c.surface0,
			background = titlebar_bg,
		},
	},
}
