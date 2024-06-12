local lush = require("lush")
local generator = require("zenbones.specs")
local p = require("nord.palette")

local base = generator.generate(p.dark, "dark", generator.get_global_config("nord", "dark"))

return lush.extends({ base }).with(function()
	---@diagnostic disable: undefined-global
	return {

		-- General Nord
		Constant({ fg = p.base.nord14 }),
		Function({ fg = p.base.nord8 }),
		Identifier({ fg = p.dark.fg }),
		Number({ fg = p.base.nord15, gui = "italic" }),
		Statement({ fg = p.base.nord9 }),

		Search({ bg = base.StatusLine.bg, gui = "bold,italic" }),

		-- Fix float popup, i.e. 'K'
		ColorColumn({ base.StatusLine }),
		FloatBorder({ base.StatusLine, fg = p.dark.bg.li(46) }),

		-- Neotree
		NeoTreeNormal({ bg = p.dark.bg.da(10) }),
		NeoTreeNormalNC({ NeoTreeNormal }),

		-- Trouble
		TroubleNormalNC({ bg = p.dark.bg.da(10) }),
		TroubleNormal({ TroubleNormalNC }),
	}
	---@diagnostic enable: undefined-global
end)
