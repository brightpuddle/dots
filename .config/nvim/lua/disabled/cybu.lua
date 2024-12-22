return {
	"ghillb/cybu.nvim",
	branch = "main",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("cybu").setup({
			behavior = {
				mode = {
					last_used = {
						switch = "immediate",
					},
				},
			},
		})
	end,
	keys = {
		{ "<C-o>]", "<cmd>CybuLastusedNext<cr>", mode = { "n", "i", "v" }, desc = "Next Buffer" },
		{ "<C-o>[", "<cmd>CybuLastusedPrev<cr>", mode = { "n", "i", "v" }, desc = "Previous Buffer" },
		{ "<leader>]", "<cmd>CybuLastusedNext<cr>", desc = "Next Buffer" },
		{ "<leader>[", "<cmd>CybuLastusedPrev<cr>", desc = "Previous Buffer" },
		{ "L", "<cmd>CybuLastusedNext<cr>", desc = "Next Buffer" },
		{ "H", "<cmd>CybuLastusedPrev<cr>", desc = "Previous Buffer" },
		{ "<leader>bl", "<cmd>CybuLastusedNext<cr>", desc = "Next Buffer" },
		{ "<leader>bh", "<cmd>CybuLastusedPrev<cr>", desc = "Previous Buffer" },
	},
}
