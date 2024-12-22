return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		auto_hide = 1,
		animation = false,
		highlight_visible = false,
		icons = {
			separator_at_end = false,
		},
	},
	lazy = false,
	keys = {
		{ "<C-o>]", "<cmd>BufferNext<cr>", mode = { "n", "i", "v" }, desc = "Next Buffer" },
		{ "<C-o>[", "<cmd>BufferPrevious<cr>", mode = { "n", "i", "v" }, desc = "Previous Buffer" },
		{ "<leader>]", "<cmd>BufferNext<cr>", desc = "Next Buffer" },
		{ "<leader>[", "<cmd>BufferPrevious<cr>", desc = "Previous Buffer" },
		{ "L", "<cmd>BufferNext<cr>", desc = "Next Buffer" },
		{ "H", "<cmd>BufferPrevious<cr>", desc = "Previous Buffer" },
		{ "<leader>bl", "<cmd>BufferNext<cr>", desc = "Next Buffer" },
		{ "<leader>bh", "<cmd>BufferPrevious<cr>", desc = "Previous Buffer" },
	},
}
