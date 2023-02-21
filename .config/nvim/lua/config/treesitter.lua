return function()
	require("nvim-treesitter.configs").setup({
		highlight = {
			enable = true,
		},
		playground = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
	})
end
