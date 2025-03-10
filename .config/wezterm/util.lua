local w = require("wezterm")

M = {}

M.get_appearance = function()
	-- return "Dark"
	if w.gui then
		return w.gui.get_appearance()
	end
	return "Dark"
end

M.scheme_for_appearance = function(appearance, schemes)
	if appearance:find("Dark") then
		return schemes.dark
	else
		return schemes.light
	end
end

return M
