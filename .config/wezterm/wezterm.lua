local w = require("wezterm")
local a = w.action

local function map(key, mods, action)
	local res = { key = key }
	if mods then
		res["mods"] = mods
	end
	if action then
		res["action"] = action
	end
	return res
end

local function send(...)
	local arg = { ... }
	local res = {}
	for _, v in ipairs(arg) do
		if type(v) == "table" then
			table.insert(res, a.SendKey(v))
		elseif type(v) == "string" then
			table.insert(res, a.SendKey({ key = v }))
		end
	end
	if #res == 1 then
		return res[1]
	elseif #res > 1 then
		return a.Multiple(res)
	end
end

-- nvim
local ctrl_o = { key = "o", mods = "CTRL" }
-- tmux
local ctrl_a = { key = "a", mods = "CTRL" }
-- cross-tool window mgmt
local ctrl_w = { key = "w", mods = "CTRL" }

local C = {
	active = {
		fg = "#d8dee9",
		bg = "#434c5e",
	},
	inactive = {
		fg = "#d8dee9",
		bg = "#2e3440",
	},
	bg = "#2a2e38",
	-- bg = "#000000",
	fg = "#d8dee9",
}
-- local sep = {
-- 	left = "",
-- 	right = "",
-- }

-- tab, tabs, panes, config, hover, max_width
-- w.on("format-tab-title", function(tab, _, _, _, _, max_width)
-- 	local title = string.gmatch(tab.active_pane.title, "([^/]+)$")()
-- 	local width = max_width - 9
-- 	if #title > width then
-- 		title = string.sub(title, #title - width, #title)
-- 	end
-- 	if tab.is_active then
-- 		return {
-- 			{ Foreground = { Color = "#8fbcbb" } },
-- 			{ Text = "  " },
-- 			{ Foreground = { Color = C.active.fg } },
-- 			{ Text = " " .. title .. " " },
-- 		}
-- 	else
-- 		return {
-- 			{ Foreground = { Color = C.inactive.fg } },
-- 			{ Text = "  " },
-- 			{ Text = " " .. title .. " " },
-- 		}
-- 	end
-- 	-- if tab.is_active then
-- 	-- 	return {
-- 	-- 		{ Background = { Color = C.bg } },
-- 	-- 		{ Text = " " },
-- 	-- 		{ Background = { Color = C.bg } },
-- 	-- 		{ Foreground = { Color = C.active.bg } },
-- 	-- 		{ Text = sep.left },
-- 	-- 		{ Background = { Color = C.active.bg } },
-- 	-- 		{ Foreground = { Color = "#8fbcbb" } },
-- 	-- 		{ Text = "  " },
-- 	-- 		{ Foreground = { Color = C.active.fg } },
-- 	-- 		{ Text = " " .. title .. " " },
-- 	-- 		{ Background = { Color = C.bg } },
-- 	-- 		{ Foreground = { Color = C.active.bg } },
-- 	-- 		{ Text = sep.right },
-- 	-- 		{ Background = { Color = C.bg } },
-- 	-- 		{ Text = " " },
-- 	-- 	}
-- 	-- else
-- 	-- 	return {
-- 	-- 		{ Background = { Color = C.bg } },
-- 	-- 		{ Text = " " },
-- 	-- 		{ Background = { Color = C.bg } },
-- 	-- 		{ Foreground = { Color = C.inactive.bg } },
-- 	-- 		{ Text = sep.left },
-- 	-- 		{ Background = { Color = C.inactive.bg } },
-- 	-- 		{ Foreground = { Color = C.inactive.fg } },
-- 	-- 		{ Text = "  " },
-- 	-- 		{ Text = " " .. title .. " " },
-- 	-- 		{ Background = { Color = C.bg } },
-- 	-- 		{ Foreground = { Color = C.inactive.bg } },
-- 	-- 		{ Text = sep.right },
-- 	-- 		{ Background = { Color = C.bg } },
-- 	-- 		{ Text = " " },
-- 	-- 	}
-- 	-- end
-- end)

return {
	-- window_background_image = "/Users/nathan/Pictures/dancer.jpeg",
	-- Font
	font = w.font("RobotoMono Nerd Font", { weight = "Medium" }),
	font_size = 15.0,
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	line_height = 0.90,
	--
	color_scheme = "nord",
	check_for_updates = false,
	window_decorations = "RESIZE",
	disable_default_key_bindings = true,
	native_macos_fullscreen_mode = true,
	enable_tab_bar = false,
	use_fancy_tab_bar = false,
	show_tabs_in_tab_bar = true,
	show_new_tab_button_in_tab_bar = false,
	tab_max_width = 32,
	default_prog = { "zsh", "-c", "tmux" },
	window_padding = {
		left = 8,
		right = 8,
		top = 8,
		bottom = 8,
	},
	window_frame = {
		active_titlebar_bg = C.bg,
		inactive_titlebar_bg = C.bg,
		font = w.font({ family = "Roboto Mono", weight = "Bold" }),
		font_size = 14.0,
	},
	colors = {
		tab_bar = {
			background = C.bg,
			active_tab = {
				bg_color = C.active.bg,
				fg_color = C.active.fg,
			},
			inactive_tab = {
				bg_color = C.inactive.bg,
				fg_color = C.inactive.fg,
			},
		},
	},
	scrollback_lines = 3500,
	keys = {
		-- MacOS default
		map("s", "CMD", send(ctrl_o, "w")),
		map("w", "CMD", send(map("d", "CTRL"))),
		map(",", "CMD", a.SendString("vi ~/.config/wezterm/wezterm.lua\r")),
		map("z", "CMD", send(ctrl_a, "z")),
		map("c", "CMD", a.CopyTo("Clipboard")),
		map("v", "CMD", a.PasteFrom("Clipboard")),
		map("m", "CMD", a.Hide),
		map("h", "CMD", a.HideApplication),
		-- map("h", "CMD|SHIFT", a.Hide)
		map("n", "CMD", a.SpawnWindow),
		map("f", "CMD|SHIFT", a.ToggleFullScreen),
		map("=", "CMD", a.IncreaseFontSize),
		map("-", "CMD", a.DecreaseFontSize),
		map("0", "CMD", a.ResetFontSize),
		map("Space", "CTRL|SHIFT", a.ActivateCommandPalette),

		-- Split
		-- map("d", "CMD", a.SplitVertical({ domain = "CurrentPaneDomain" })),
		-- map("d", "CMD|SHIFT", a.SplitHorizontal({ domain = "CurrentPaneDomain" })),
		map("d", "CMD", send(ctrl_w, "s")),
		map("d", "CMD|SHIFT", send(ctrl_w, "S")),
		-- Vim/tmux nav
		map("h", "CMD|SHIFT", send(ctrl_w, "h")),
		map("j", "CMD|SHIFT", send(ctrl_w, "j")),
		map("k", "CMD|SHIFT", send(ctrl_w, "k")),
		map("l", "CMD|SHIFT", send(ctrl_w, "l")),
		-- "CtrlP"
		map("p", "CMD", send(map("p", "CTRL"))),

		-- "Ctrl-A" for tmux
		map("a", "CMD", send(ctrl_a)),

		-- Find/search
		map("p", "CMD", send(map("p", "CTRL"))),
		map("o", "CMD", send(ctrl_o, "f", "b")),
		map("p", "CMD|SHIFT", send(ctrl_o, "f", "a")),
		map("f", "CMD", send(ctrl_a, "c")),

		-- Splits / windows
		map("Enter", "CMD", send(ctrl_a, "z")),
		map("Enter", "CMD|SHIFT", send(ctrl_o, "c")),

		-- Rotate
		map("r", "CMD", send(ctrl_a, "r")),
		-- Mirror
		map("y", "CMD", send(ctrl_a, "y")),
		-- Tab
		map("t", "CMD", send(ctrl_a, "n")),

		-- Vim tab nav
		map("]", "CMD", send(ctrl_o, "n")),
		map("[", "CMD", send(ctrl_o, "p")),

		-- Tmux tab nav
		map("}", "CMD|SHIFT", send(ctrl_a, "]")),
		map("{", "CMD|SHIFT", send(ctrl_a, "[")),
		map("]", "CMD|SHIFT", send(ctrl_a, "]")),
		map("[", "CMD|SHIFT", send(ctrl_a, "[")),

		-- Mirror VSCode panels
		map("b", "CMD", send(ctrl_o, "b")),
		map("e", "CMD|SHIFT", send(ctrl_o, "b")),
		map("j", "CMD", send(ctrl_o, "j")),
		map("k", "CMD", send(ctrl_o, "k")),
	},
	-- },
}
