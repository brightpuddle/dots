return {
	"cormacrelf/dark-notify",
	config = function()
		require("dark_notify").run({
			dark = "nord",
			light = "zenwritten",
			onchange = function(dark)
				require("theme")(dark)
			end,
		})
	end,
}
