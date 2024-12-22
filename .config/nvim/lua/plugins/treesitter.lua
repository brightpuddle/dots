-- Syntax highlighting
return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "nvim-treesitter/playground", lazy = true },
		{ "windwp/nvim-ts-autotag" },
	},

	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
			},
			-- autotag = {
			-- 	enable = true,
			-- },
			matchup = {
				enable = true,
			},
		})
		vim.treesitter.language.register("groovy", "Jenkinsfile")
	end,
}
