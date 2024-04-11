return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {

		{ "nvim-treesitter/playground", lazy = true },
	},

	config = function()
		require("nvim-treesitter.configs").setup({
			matchup = {
				enable = true,
			},
			highlight = {
				enable = true,
			},
			playground = {
				enable = true,
			},
		})
		vim.treesitter.language.register("groovy", "Jenkinsfile")
	end,
}
