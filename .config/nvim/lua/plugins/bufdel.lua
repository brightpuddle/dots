-- Close tab, buffer, or neovim
return {
	"ojroques/nvim-bufdel",
	keys = {
		{ "<C-d>", "<cmd>BufDel<cr>", mode = { "n", "i", "v" }, silent = true, desc = "Close" },
		{ "<leader>bc", "<cmd>BufDel<cr>", desc = "Close" },
	},
}
