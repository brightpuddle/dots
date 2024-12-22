-- Find files, buffers, tags, symbols, and more with the Telescope.nvim plugin.
local find_all = function()
	require("telescope").extensions.smart_open.smart_open({ cwd_only = true })
end

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"VonHeikemen/lsp-zero.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{
			"danielfalk/smart-open.nvim",
			branch = "0.2.x",
			dependencies = {
				"kkharji/sqlite.lua",
			},
		},
	},
	cmd = { "Telescope" },
	config = function()
		require("telescope.actions")
		local trouble = require("trouble.sources.telescope")

		require("telescope").setup({
			defaults = {
				mappings = {
					i = { ["<C-o>j"] = trouble.open },
					n = { ["<C-o>j"] = trouble.open },
				},
			},
			pickers = {
				buffers = {
					theme = "dropdown",
				},
			},
		})
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("smart_open")
	end,
	keys = {
		{ "<C-f>", find_all, desc = "Find", mode = { "n", "i" } },
		{ "<leader>fa", find_all, desc = "Find" },
		{ "<leader>ff", "<cmd>Telescope<cr>", desc = "Find all files" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find in files" },
		{ "<leader>ft", "<cmd>Telescope tags<cr>", desc = "Find tags" },
		{ "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Find symbols" },
		{ "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Find diagnostics" },
	},
}
