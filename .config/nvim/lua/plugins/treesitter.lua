return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {

		{ "nvim-treesitter/playground", lazy = true },
	},

	config = function()
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
	end,
}
