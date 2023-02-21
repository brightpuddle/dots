return function()
	require("neo-tree").setup({
		sort_function = function(a, b)
			if a.type == b.type then
				local bufno_a = string.match(a.path, "#%d+$")
				local bufno_b = string.match(b.path, "#%d+$")
				if bufno_a and bufno_b then
					return bufno_a > bufno_b
				end
				return a.path > b.path
			else
				return a.type > b.type
			end
		end,
		default_component_configs = {
			name = {
				use_git_status_colors = false,
			},
		},
	})
end
