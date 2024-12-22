-- Handle matching pairs of parentheses, brackets, quotes, etc.
return {
	"kylechui/nvim-surround",
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({})
	end,
}
