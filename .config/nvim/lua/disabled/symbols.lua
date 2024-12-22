-- Symbol navigation
return {
	"simrat39/symbols-outline.nvim",
	cmd = { "SymbolsOutline" },
	config = function()
		require("symbols-outline").setup()
	end,
	keys = {
		{ "<leader>ss", "<cmd>SymbolsOutline<cr>", desc = "Symbol Outline" },
		{ "<C-o>r", "<cmd>SymbolsOutline<cr>", desc = "Symbol Outline" },
	},
}
