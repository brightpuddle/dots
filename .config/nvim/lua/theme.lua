local lush = require("lush")
local specs = require("zenwritten")

vim.g.zenwritten = {
	darken_noncurrent_window = true,
	lighten_noncurrent_window = true,
	transparent_background = true,
}
return function(dark)
	local p = require("zenwritten.palette")[dark]

	local specs = lush.parse(function()
		---@diagnostic disable: undefined-global
		return {
			Constant({ fg = p.wood }),
			Identifier({ fg = p.rose }),
			NeoTreeNormal({ bg = p.bg.da(2) }),
			NeoTreeNormalNC({ NeoTreeNormal }),
		}
	end)

	lush.apply(lush.compile(specs))
end
