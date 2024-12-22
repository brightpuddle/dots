return {
	"cbochs/grapple.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	opts = {
		scope = "git",
	},
	event = { "BufReadPost", "BufNewFile" },
	cmd = "Grapple",
	keys = {
		{ "<leader>tt", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
		{ "<leader>st", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple show tags" },
		{ "<leader>tn", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
		{ "<leader>tp", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
	},
}
