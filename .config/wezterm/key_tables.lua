local w = require("wezterm")
local a = w.action

return {
	-- added new shortcuts to the end
	copy_mode = {
		{ key = "c", mods = "CTRL", action = a.CopyMode("Close") },
		{ key = "g", mods = "CTRL", action = a.CopyMode("Close") },
		{ key = "q", mods = "NONE", action = a.CopyMode("Close") },
		{ key = "Escape", mods = "NONE", action = a.CopyMode("Close") },

		{ key = "h", mods = "NONE", action = a.CopyMode("MoveLeft") },
		{ key = "j", mods = "NONE", action = a.CopyMode("MoveDown") },
		{ key = "k", mods = "NONE", action = a.CopyMode("MoveUp") },
		{ key = "l", mods = "NONE", action = a.CopyMode("MoveRight") },

		{ key = "LeftArrow", mods = "NONE", action = a.CopyMode("MoveLeft") },
		{ key = "DownArrow", mods = "NONE", action = a.CopyMode("MoveDown") },
		{ key = "UpArrow", mods = "NONE", action = a.CopyMode("MoveUp") },
		{ key = "RightArrow", mods = "NONE", action = a.CopyMode("MoveRight") },

		{ key = "RightArrow", mods = "ALT", action = a.CopyMode("MoveForwardWord") },
		{ key = "f", mods = "ALT", action = a.CopyMode("MoveForwardWord") },
		{ key = "Tab", mods = "NONE", action = a.CopyMode("MoveForwardWord") },
		{ key = "w", mods = "NONE", action = a.CopyMode("MoveForwardWord") },

		{ key = "LeftArrow", mods = "ALT", action = a.CopyMode("MoveBackwardWord") },
		{ key = "b", mods = "ALT", action = a.CopyMode("MoveBackwardWord") },
		{ key = "Tab", mods = "SHIFT", action = a.CopyMode("MoveBackwardWord") },
		{ key = "b", mods = "NONE", action = a.CopyMode("MoveBackwardWord") },

		{ key = "0", mods = "NONE", action = a.CopyMode("MoveToStartOfLine") },
		{ key = "Enter", mods = "NONE", action = a.CopyMode("MoveToStartOfNextLine") },

		{ key = "$", mods = "NONE", action = a.CopyMode("MoveToEndOfLineContent") },
		{ key = "$", mods = "SHIFT", action = a.CopyMode("MoveToEndOfLineContent") },
		{ key = "^", mods = "NONE", action = a.CopyMode("MoveToStartOfLineContent") },
		{ key = "^", mods = "SHIFT", action = a.CopyMode("MoveToStartOfLineContent") },
		{ key = "m", mods = "ALT", action = a.CopyMode("MoveToStartOfLineContent") },

		{ key = " ", mods = "NONE", action = a.CopyMode({ SetSelectionMode = "Cell" }) },
		{ key = "v", mods = "NONE", action = a.CopyMode({ SetSelectionMode = "Cell" }) },
		{ key = "V", mods = "NONE", action = a.CopyMode({ SetSelectionMode = "Line" }) },
		{ key = "V", mods = "SHIFT", action = a.CopyMode({ SetSelectionMode = "Line" }) },
		{ key = "v", mods = "CTRL", action = a.CopyMode({ SetSelectionMode = "Block" }) },

		{ key = "G", mods = "NONE", action = a.CopyMode("MoveToScrollbackBottom") },
		{ key = "G", mods = "SHIFT", action = a.CopyMode("MoveToScrollbackBottom") },
		{ key = "g", mods = "NONE", action = a.CopyMode("MoveToScrollbackTop") },

		{ key = "H", mods = "NONE", action = a.CopyMode("MoveToViewportTop") },
		{ key = "H", mods = "SHIFT", action = a.CopyMode("MoveToViewportTop") },
		{ key = "M", mods = "NONE", action = a.CopyMode("MoveToViewportMiddle") },
		{ key = "M", mods = "SHIFT", action = a.CopyMode("MoveToViewportMiddle") },
		{ key = "L", mods = "NONE", action = a.CopyMode("MoveToViewportBottom") },
		{ key = "L", mods = "SHIFT", action = a.CopyMode("MoveToViewportBottom") },

		{ key = "o", mods = "NONE", action = a.CopyMode("MoveToSelectionOtherEnd") },
		{ key = "O", mods = "NONE", action = a.CopyMode("MoveToSelectionOtherEndHoriz") },
		{ key = "O", mods = "SHIFT", action = a.CopyMode("MoveToSelectionOtherEndHoriz") },

		{ key = "PageUp", mods = "NONE", action = a.CopyMode("PageUp") },
		{ key = "PageDown", mods = "NONE", action = a.CopyMode("PageDown") },

		{ key = "b", mods = "CTRL", action = a.CopyMode("PageUp") },
		{ key = "f", mods = "CTRL", action = a.CopyMode("PageDown") },

		-- Enter y to copy and quit the copy mode.
		{
			key = "y",
			mods = "NONE",
			action = a.Multiple({
				a.CopyTo("ClipboardAndPrimarySelection"),
				a.CopyMode("Close"),
			}),
		},
		-- Enter search mode to edit the pattern.
		-- When the search pattern is an empty string the existing pattern is preserved
		{ key = "/", mods = "NONE", action = a({ Search = { CaseSensitiveString = "" } }) },
		{ key = "?", mods = "NONE", action = a({ Search = { CaseInSensitiveString = "" } }) },
		{ key = "n", mods = "CTRL", action = a({ CopyMode = "NextMatch" }) },
		{ key = "p", mods = "CTRL", action = a({ CopyMode = "PriorMatch" }) },
	},

	search_mode = {
		{ key = "Escape", mods = "NONE", action = a({ CopyMode = "Close" }) },
		-- Go back to copy mode when pressing enter, so that we can use unmodified keys like "n"
		-- to navigate search results without conflicting with typing into the search area.
		{ key = "Enter", mods = "NONE", action = "ActivateCopyMode" },
		{ key = "c", mods = "CTRL", action = "ActivateCopyMode" },
		{ key = "n", mods = "CTRL", action = a({ CopyMode = "NextMatch" }) },
		{ key = "p", mods = "CTRL", action = a({ CopyMode = "PriorMatch" }) },
		{ key = "r", mods = "CTRL", action = a.CopyMode("CycleMatchType") },
		{ key = "u", mods = "CTRL", action = a.CopyMode("ClearPattern") },
	},
}
