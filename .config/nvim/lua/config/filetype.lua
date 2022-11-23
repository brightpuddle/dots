return function()
	require("filetype").setup({
		overrides = {
			extensions = {
				v = "vlang",
				tf = "terraform",
			},
		},
	})
end
