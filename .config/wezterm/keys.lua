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

return {
	-- Improved MacOS defaults
	map(",", "CMD", a.SendString("vi ~/.config/wezterm/wezterm.lua\r")),
	map("s", "CMD", send(ctrl_o, "w")),
	map("w", "CMD", send(map("d", "CTRL"))),
	map("z", "CMD", send(ctrl_a, "z")),

	-- "Ctrl-A" for tmux
	map("a", "CMD", send(ctrl_a)),

	-- "CtrlP"
	map("p", "CMD", send(map("p", "CTRL"))),

	-- Find/search
	map("p", "CMD", send(map("p", "CTRL"))),
	map("o", "CMD", send(ctrl_o, "f", "b")),
	map("p", "CMD|SHIFT", send(ctrl_o, "f", "a")),
	map("f", "CMD", send(ctrl_a, "c")),

	-- Splits / windows
	map("Enter", "CMD", send(ctrl_a, "z")),

	-- Split
	map("d", "CMD", send(ctrl_w, "s")),
	map("d", "CMD|SHIFT", send(ctrl_w, "S")),

	-- Rotate
	map("r", "CMD", send(ctrl_a, "r")),
	-- Mirror
	map("y", "CMD", send(ctrl_a, "y")),
	-- Tab
	map("t", "CMD", send(ctrl_a, "n")),

	-- Vim/tmux nav
	map("h", "CMD|SHIFT", send(ctrl_w, "h")),
	map("j", "CMD|SHIFT", send(ctrl_w, "j")),
	map("k", "CMD|SHIFT", send(ctrl_w, "k")),
	map("l", "CMD|SHIFT", send(ctrl_w, "l")),

	-- Vim tab nav
	map("]", "CMD", send(ctrl_o, "n")),
	map("[", "CMD", send(ctrl_o, "p")),

	-- Tmux tab nav
	map("}", "CMD|SHIFT", send(ctrl_a, "]")),
	map("{", "CMD|SHIFT", send(ctrl_a, "[")),

	-- Mirror VSCode panels
	map("b", "CMD", send(ctrl_o, "b")),
	map("e", "CMD|SHIFT", send(ctrl_o, "b")),
	map("j", "CMD", send(ctrl_o, "j")),
	map("k", "CMD", send(ctrl_o, "k")),
}
