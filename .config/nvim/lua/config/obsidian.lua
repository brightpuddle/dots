return function()
	require("obsidian").setup({
		dir = "~/notes",
		completion = {
			nvim_cmp = true,
		},
	})
end
