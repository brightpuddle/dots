local w = require("wezterm")
local config = w.config_builder()

local function merge(subconfig)
	for k, v in pairs(subconfig) do
		config[k] = v
	end
end

merge(require("settings"))
merge(require("keys"))
merge(require("status"))

return config
