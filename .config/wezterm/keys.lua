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
-- tmux/nvim window mgmt
local ctrl_w = { key = "w", mods = "CTRL" }
-- tmux
local ctrl_a = { key = "a", mods = "CTRL" }

return {
	-- Save
	map("s", "CMD", send(ctrl_o, "w")),
	-- Preferences
	map(",", "CMD", a.SendString("vi ~/.config/wezterm/wezterm.lua\r")),
	-- Window Mgmt
	map("n", "CMD", a.SpawnWindow),
	map("m", "CMD", a.Hide),
	map("h", "CMD", a.HideApplication),
	map("f", "CMD|SHIFT", a.ToggleFullScreen),
	map("f", "CMD", send(ctrl_o, "t")),
	map("w", "CMD", send(map("d", "CTRL"))),

	-- Font size
	map("=", "CMD", a.IncreaseFontSize),
	map("-", "CMD", a.DecreaseFontSize),
	map("0", "CMD", a.ResetFontSize),

	-- Clipboard
	map("c", "CMD", a.CopyTo("Clipboard")),
	map("v", "CMD", a.PasteFrom("Clipboard")),

	-- Wezterm command palette
	map("Space", "CTRL|SHIFT", a.ActivateCommandPalette),

	-- Find/search
	map("p", "CMD", send(map("p", "CTRL"))),
	map("p", "CMD|SHIFT", send(ctrl_o, "f", "a")),

	-- Window management
	map("d", "CMD", send(ctrl_w, "s")),
	map("d", "CMD|SHIFT", send(ctrl_w, "S")),

	-- Vim/tmux nav
	map("h", "CMD|SHIFT", send(ctrl_w, "h")),
	map("j", "CMD|SHIFT", send(ctrl_w, "j")),
	map("k", "CMD|SHIFT", send(ctrl_w, "k")),
	map("l", "CMD|SHIFT", send(ctrl_w, "l")),

	-- Tmux pane management
	map("r", "CMD", send(ctrl_a, "r")), -- Rotate
	map("y", "CMD", send(ctrl_a, "y")), -- Mirror
	map("t", "CMD", send(ctrl_a, "n")), -- Tab
	map("Enter", "CMD", send(ctrl_a, "z")), -- Zoom

	-- Tmux tab nav
	map("}", "CMD|SHIFT", send(ctrl_a, "]")),
	map("{", "CMD|SHIFT", send(ctrl_a, "[")),
	map("1", "CMD", send(ctrl_a, "0")),
	map("2", "CMD", send(ctrl_a, "1")),
	map("3", "CMD", send(ctrl_a, "2")),
	map("4", "CMD", send(ctrl_a, "3")),
	map("5", "CMD", send(ctrl_a, "4")),
	map("6", "CMD", send(ctrl_a, "5")),
	map("7", "CMD", send(ctrl_a, "6")),
	map("8", "CMD", send(ctrl_a, "7")),
	map("9", "CMD", send(ctrl_a, "8")),
	-- Vim tab nav
	map("]", "CMD", send(ctrl_o, "]")),
	map("[", "CMD", send(ctrl_o, "[")),

	-- "Ctrl-A" for tmux
	map("a", "CMD", send(ctrl_a)),

	-- Mirror VSCode panels
	map("b", "CMD", send(ctrl_o, "b")),
	map("e", "CMD|SHIFT", send(ctrl_o, "b")),
	map("j", "CMD", send(ctrl_o, "j")),
	map("k", "CMD", send(ctrl_o, "k")),
}
