return {
	"cormacrelf/dark-notify",
	config = function()
		require("dark_notify").run({
			dark = "zenwritten",
			light = "zenwritten",
			onchange = function(dark)
				require("theme")(dark)
			end,
		})
	end,
}
