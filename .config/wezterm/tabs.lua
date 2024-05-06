local w = require("wezterm")
local c = require("colors")
local sep = {
	left = "",
	right = "",
}

local function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

-- tab, tabs, panes, config, hover, max_width
w.on("format-tab-title", function(tab, _, _, _, _, max_width)
	local title = tab_title(tab)
	local width = max_width - 6
	if #title > width then
		title = w.truncate_left(title, width)
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
