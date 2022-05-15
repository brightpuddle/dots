return function()
	local telescope = require("telescope")
	require("telescope.actions")
	local trouble = require("trouble.providers.telescope")

	telescope.load_extension("fzf")
	telescope.setup({
		defaults = {
			mappings = {
				i = { ["<C-o>j"] = trouble.open_with_trouble },
				n = { ["<C-o>j"] = trouble.open_with_trouble },
			},
		},
	})
end
