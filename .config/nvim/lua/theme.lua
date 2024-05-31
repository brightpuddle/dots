local lush = require("lush")
-- local specs = require("nord")

vim.g.zenwritten = {
	lightness = "bright",
	darken_noncurrent_window = true,
	lighten_noncurrent_window = true,
	transparent_background = true,
}
return function(dark)
	-- local base = require("zenwritten")
	local p = require("zenwritten.palette")[dark]

	local specs = lush.parse(function()
		---@diagnostic disable: undefined-global
		return {
			Constant({ fg = p.wood }),
			-- Identifier({ fg = p.rose }),
		}
	end)

	lush.apply(lush.compile(specs))
end
