return function()
	require("filetype").setup({
		overrides = {
			extensions = {
				v = "vlang",
			},
		},
	})
end
