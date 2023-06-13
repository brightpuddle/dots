local k = vim.keymap
k.set({ "n", "i" }, "<C-o>b", "<cmd>Neotree toggle<cr>")
k.set("n", "<leader>ob", "<cmd>Neotree toggle buffers<cr>")

return function()
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
end
