return function()
	require("neo-tree").setup({
		default_component_configs = {
			name = {
				use_git_status_colors = false,
			},
		},
	})
end
