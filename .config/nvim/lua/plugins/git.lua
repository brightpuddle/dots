-- Git support
return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	config = function()
		require("gitsigns").setup({ signcolumn = false })
	end,
}
