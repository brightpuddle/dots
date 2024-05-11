return {
	"MeanderingProgrammer/markdown.nvim",
	name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	ft = { "markdown" },
	config = function()
		require("render-markdown").setup({
			highlights = {
				heading = {
					backgrounds = {
						"Headline1",
						"Headline2",
						"Headline3",
						"Headline4",
						"Headline5",
						"Headline6",
					},
					foregrounds = {
						"Headline1",
						"Headline2",
						"Headline3",
						"Headline4",
						"Headline5",
						"Headline6",
					},
				},
			},
		})
	end,
}

-- return {
-- 	"preservim/vim-markdown",
-- 	dependencies = "godlygeek/tabular",
-- 	ft = { "markdown" },
-- }
