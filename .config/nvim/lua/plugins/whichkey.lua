return {
	"folke/which-key.nvim",
	config = function()
		require("which-key").setup({
			icons = {
				breadcrumb = "»",
				separator = "  ",
				group = "+",
			},
		})
	end,
}
