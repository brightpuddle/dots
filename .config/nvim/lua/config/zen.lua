return function()
	require("zen-mode").setup({
		window = {
			backdrop = 1,
			options = { number = false },
			width = 100,
			height = 0.90,
		},
		plugins = {
			twilight = { enabled = true },
			-- tmux = { enabled = true },
			-- kitty = { enabled = true, font = "+1" },
		},
	})
end
