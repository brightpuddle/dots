return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"VonHeikemen/lsp-zero.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	cmd = { "Telescope" },
	config = function()
		require("telescope.actions")
		local trouble = require("trouble.providers.telescope")

		require("telescope").setup({
			defaults = {
				mappings = {
					i = { ["<C-o>j"] = trouble.open_with_trouble },
					n = { ["<C-o>j"] = trouble.open_with_trouble },
				},
			},
			pickers = {
				buffers = {
					theme = "dropdown",
				},
			},
		})
		require("telescope").load_extension("fzf")
	end,
}
