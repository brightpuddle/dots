local lush = require("lush")
local generator = require("zenbones.specs")
local p = require("nord.palette")

local base = generator.generate(p.dark, "dark", generator.get_global_config("nord", "dark"))

return lush.extends({ base }).with(function()
	---@diagnostic disable: undefined-global
	return {
		-- Number { fg = p.base.nord7, gui = "italic" },
		-- Identifier { fg = p.dark.fg },
		-- Function { fg = p.base.nord8 },
		-- Statement { fg = p.base.nord9 },
		-- Type { fg = p.base.nord10 },
	}
	---@diagnostic enable: undefined-global
end)
