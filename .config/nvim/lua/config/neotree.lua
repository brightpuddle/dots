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
