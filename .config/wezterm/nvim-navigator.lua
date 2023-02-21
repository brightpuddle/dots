local w = require("wezterm")
local a = w.action

local function isViProcess(pane)
	return pane:get_foreground_process_name():find("vi") ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
	if isViProcess(pane) then
		window:perform_action(
			-- This should match the keybinds you set in Neovim.
			a.SendMultiple({
				a.SendKey({ key = "w", mods = "CTRL" }),
				a.SendKey({ key = vim_direction }),
			}),
			pane
		)
	else
		window:perform_action(a.ActivatePaneDirection(pane_direction), pane)
	end
end

return function()
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
end
