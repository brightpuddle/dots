local util = require("util")

local dark = {
	-- Surface is alternative background
	surface0 = "#272c36",
	text0 = "#bcc1cb",
	surface1 = "#3b4252",
	text1 = "#d8dee9",
	surface2 = "#434c5e",
	text2 = "#e5e9f0",
	bg = "#2e3440",
	fg = "#eceff4",
	rose = "#b48ead",
	leaf = "#a3be8c",
	wood = "#d08770",
	water = "#5e81ac",
	blossom = "#b48ead",
	sky = "#88c0d0",
}

local light = {
	surface0 = "#f0edec",
	text0 = "#2c363c",
	surface1 = "#e5d7d0",
	text1 = "#364147",
	surface2 = "#cfc1ba",
	text2 = "#404b52",
	-- bg = "#fdfdfd",
	bg = "#f7f6f5",
	fg = "#202E18",
	rose = "#a8334c",
	leaf = "#4f6c31",
	wood = "#944927",
	water = "#286486",
	blossom = "#88507d",
	sky = "#3b8992",
}

local theme
if util.get_appearance() == "Dark" then
	theme = dark
else
	theme = light
end

return theme
