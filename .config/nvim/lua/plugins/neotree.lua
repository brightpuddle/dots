-- File tree
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	config = function()
		require("neo-tree").setup({
			filesystem = {
				follow_current_file = true,
			},
			default_component_configs = {
				name = {
					use_git_status_colors = false,
				},
			},
		})
	end,
	keys = {
		{ "<leader>st", "<cmd>Neotree toggle<cr>", desc = "Neotree" },
		{ "<C-o>e", "<cmd>Neotree toggle<cr>", desc = "Neotree" },
	},
}
