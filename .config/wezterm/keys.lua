local w = require("wezterm")
local a = w.action

-- Session manager
local session_manager = require("wezterm-session-manager/session-manager")
w.on("save_session", function(window)
	session_manager.save_state(window)
end)
w.on("load_session", function(window)
	session_manager.load_state(window)
end)
w.on("restore_session", function(window)
	session_manager.restore_state(window)
end)

local ctrl_o = { key = "o", mods = "CTRL" } -- nvim
local ctrl_w = { key = "w", mods = "CTRL" } -- window mgmt

-- shortcut for creating key map objects
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

-- shortcut for creating SendKey or Mulitple objects
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

-- Determine if we're in vi
local function isViProcess(pane)
	return pane:get_foreground_process_name():find("n?vim?") ~= nil or pane:get_title():find("n?vim?") ~= nil
end

-- Switch window for vi or wezterm
local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
	if isViProcess(pane) then
		window:perform_action(send(ctrl_w, vim_direction), pane)
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

w.on("trigger-vim-with-scrollback", function(window, pane)
	-- Retrieve the text from the pane
	local text = pane:get_lines_as_text(pane:get_dimensions().scrollback_rows)

	-- Create a temporary file to pass to vim
	local name = os.tmpname()
	local f = io.open(name, "w+")
	if f then
		f:write(text)
		f:flush()
		f:close()
	end

	-- Open a new window running vi and tell it to open the file
	window:perform_action(
		a.SpawnCommandInNewWindow({
			args = { "vi", name },
		}),
		pane
	)
	w.sleep_ms(1000)
	os.remove(name)
end)

w.on("update-right-status", function(window)
	window:set_right_status(window:active_workspace())
end)

local key_tables = {
	copy_mode = {
		map("/", "NONE", a.Search({ CaseSensitiveString = "" })),
		map("n", "NONE", a({ CopyMode = "NextMatch" })),
		map("p", "NONE", a({ CopyMode = "PriorMatch" })),
	},
	search_mode = {
		map("Escape", "NONE", "ActivateCopyMode"),
		map("Enter", "NONE", "ActivateCopyMode"),
	},
	-- 	-- map(" ", "NONE", a({ CopyMode = "ToggleSelectionByCell" })),
}

local copy_mode = w.gui.default_key_tables().copy_mode
for _, line in ipairs(key_tables.copy_mode) do
	table.insert(copy_mode, line)
end
key_tables.copy_mode = copy_mode
local search_mode = w.gui.default_key_tables().search_mode
for _, line in ipairs(key_tables.search_mode) do
	table.insert(search_mode, line)
end
key_tables.search_mode = search_mode

return {
	leader = { key = "a", mods = "CMD", timeout_milliseconds = 1000 },
	keys = {
		-- Save
		map("s", "CMD", send(ctrl_o, "w")),
		-- Preferences
		map(",", "CMD", a.SendString("vi ~/.config/wezterm/wezterm.lua\r")),
		-- Window Mgmt
		map("f", "CMD|SHIFT", a.ToggleFullScreen),
		-- Override close with ctrl-d for nvim
		map("w", "CMD", send(map("d", "CTRL"))),

		-- Wezterm Command Palette
		map("p", "CMD|SHIFT", a.ActivateCommandPalette),

		-- Fuzzy Finder - pass ctrl-f through to zsh and nvim
		-- Preserve actual ctrl-n / ctrl-p for next/previous in nvim
		map("p", "CMD", send({ key = "f", mods = "CTRL" })),

		map("d", "CMD", a.SplitVertical({ domain = "CurrentPaneDomain" })),
		map("d", "CMD|SHIFT", a.SplitHorizontal({ domain = "CurrentPaneDomain" })),

		-- Window navigation
		map("h", "CMD|SHIFT", a.EmitEvent("ActivatePaneDirection-left")),
		map("j", "CMD|SHIFT", a.EmitEvent("ActivatePaneDirection-down")),
		map("k", "CMD|SHIFT", a.EmitEvent("ActivatePaneDirection-up")),
		map("l", "CMD|SHIFT", a.EmitEvent("ActivatePaneDirection-right")),
		map("r", "CMD|SHIFT", a.RotatePanes("Clockwise")),
		map("Enter", "CMD|SHIFT", a.TogglePaneZoomState),

		-- Workspace navigation
		map("s", "LEADER", a.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" })),
		map("n", "LEADER", a.SwitchWorkspaceRelative(1)),
		map("p", "LEADER", a.SwitchWorkspaceRelative(-1)),

		-- Session Manager
		map("S", "LEADER", a({ EmitEvent = "save_session" })),
		map("L", "LEADER", a({ EmitEvent = "load_session" })),
		map("R", "LEADER", a({ EmitEvent = "restore_session" })),

		-- VSCode panel controls for neovim
		map("e", "CMD|SHIFT", send(ctrl_o, "e")),
		map("b", "CMD", send(ctrl_o, "e")),
		map("r", "CMD", send(ctrl_o, "r")),
		map("j", "CMD", send(ctrl_o, "j")),
		map("c", "LEADER", a.ActivateCopyMode),
		-- map("f", "CMD", a.EmitEvent("trigger-vim-with-scrollback")),
	},
	key_tables = key_tables,
}
