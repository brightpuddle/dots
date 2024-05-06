local w = require("wezterm")
local a = w.action

-- nvim
local ctrl_o = { key = "o", mods = "CTRL" }
local ctrl_w = { key = "w", mods = "CTRL" }

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

local function isViProcess(pane)
	return pane:get_foreground_process_name():find("n?v?im") ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
	if isViProcess(pane) then
		window:perform_action(
			-- This should match the keybinds you set in Neovim.
			send(ctrl_w, vim_direction),
			pane
		)
	else
		window:perform_action(a.ActivatePaneDirection(pane_direction), pane)
	end
end

w.on("ActivatePaneDirection-right", function(window, pane)
	conditionalActivatePane(window, pane, "Right", "l")
end)
w.on("ActivatePaneDirection-left", function(window, pane)
	conditionalActivatePane(window, pane, "Left", "h")
end)
w.on("ActivatePaneDirection-up", function(window, pane)
	conditionalActivatePane(window, pane, "Up", "k")
end)
w.on("ActivatePaneDirection-down", function(window, pane)
	conditionalActivatePane(window, pane, "Down", "j")
end)

return {
	-- Save
	map("s", "CMD", send(ctrl_o, "w")),

	-- Preferences
	map(",", "CMD", a.SendString("vi ~/.config/wezterm/wezterm.lua\r")),
	map("f", "CMD|SHIFT", a.ToggleFullScreen),
	map("w", "CMD", send(map("d", "CTRL"))),

	-- Wezterm command palette
	map("Space", "CTRL|SHIFT", a.ActivateCommandPalette),

	-- Find/search
	map("p", "CMD", send(map("p", "CTRL"))),
	map("p", "CMD|SHIFT", send(ctrl_o, "f", "a")),

	-- Pane management
	map("d", "CMD", a.SplitVertical({ domain = "CurrentPaneDomain" })),
	map("d", "CMD|SHIFT", a.SplitHorizontal({ domain = "CurrentPaneDomain" })),
	map("r", "CMD", a.RotatePanes("Clockwise")),
	map("Return", "CMD", a.TogglePaneZoomState),

	-- Mirror VSCode panels shortcuts
	map("b", "CMD", send(ctrl_o, "b")),
	map("e", "CMD|SHIFT", send(ctrl_o, "b")),
	map("j", "CMD", send(ctrl_o, "j")),
	map("k", "CMD", send(ctrl_o, "k")),

	map("h", "CMD|SHIFT", a.EmitEvent("ActivatePaneDirection-left")),
	map("j", "CMD|SHIFT", a.EmitEvent("ActivatePaneDirection-down")),
	map("k", "CMD|SHIFT", a.EmitEvent("ActivatePaneDirection-up")),
	map("l", "CMD|SHIFT", a.EmitEvent("ActivatePaneDirection-right")),
}
