-- Error/problem/diag navigation
return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	keys = {
		{ "<leader>sd", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
		{ "<C-o>j", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
		{ "<C-o>t", "<cmd>Trouble symbols toggle win.position=right focus=true<cr>", desc = "Symbols" },
	},
}
