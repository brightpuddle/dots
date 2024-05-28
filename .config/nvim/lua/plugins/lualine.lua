return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "zenwritten",
				component_separators = { left = "|", right = "|" },
				section_separators = { left = " ", right = " " },
			},
			sections = {
				lualine_a = { "branch", "diff" },
				lualine_b = { "filename" },
				lualine_c = { "diagnostics", "searchcount" },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
