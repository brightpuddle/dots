local w = require("wezterm")
local c = require("colors")
local sep = {
	left = "",
	right = "",
}

-- tab, tabs, panes, config, hover, max_width
w.on("format-tab-title", function(tab, _, _, _, _, max_width)
	local title = string.gmatch(tab.active_pane.title, "([^/]+)$")()
	local width = max_width - 9
	if #title > width then
		title = string.sub(title, #title - width, #title)
	end
	if tab.is_active then
		return {
			{ Background = { Color = c.bg } },
			{ Text = " " },
			{ Background = { Color = c.bg } },
			{ Foreground = { Color = c.active.bg } },
			{ Text = sep.left },
			{ Background = { Color = c.active.bg } },
			{ Foreground = { Color = "#8fbcbb" } },
			{ Text = "  " },
			{ Foreground = { Color = c.active.fg } },
			{ Text = " " .. title .. " " },
			{ Background = { Color = c.bg } },
			{ Foreground = { Color = c.active.bg } },
			{ Text = sep.right },
			{ Background = { Color = c.bg } },
			{ Text = " " },
		}
	else
		return {
			{ Background = { Color = c.bg } },
			{ Text = " " },
			{ Background = { Color = c.bg } },
			{ Foreground = { Color = c.inactive.bg } },
			{ Text = sep.left },
			{ Background = { Color = c.inactive.bg } },
			{ Foreground = { Color = c.inactive.fg } },
			{ Text = "  " },
			{ Text = " " .. title .. " " },
			{ Background = { Color = c.bg } },
			{ Foreground = { Color = c.inactive.bg } },
			{ Text = sep.right },
			{ Background = { Color = c.bg } },
			{ Text = " " },
		}
	end
end)

return {
	tab_max_width = 32,
	show_tabs_in_tab_bar = true,
	show_new_tab_button_in_tab_bar = false,
	show_close_tab_button_in_tabs = false,
	hide_tab_bar_if_only_one_tab = false,
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
}
