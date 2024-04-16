return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local colors = {

			nord0 = "#2E3440",
			nord1 = "#3B4252",
			nord2 = "#434C5E",
			nord3 = "#4C566A",

			nord4 = "#D8DEE9",
			nord5 = "#E5E9F0",
			nord6 = "#ECEFF4",

			-- NordFrost
			nord7 = "#8FBCBB",
			nord8 = "#88C0D0",
			nord9 = "#81A1C1",
			nord10 = "#5E81AC",

			-- NordAura
			nord11 = "#BF616A",
			nord12 = "#D08770",
			nord13 = "#EBCB8B",
			nord14 = "#A3BE8C",
			nord15 = "#B48EAD",
		}

		local nord = {
			normal = {
				a = { fg = colors.nord4, bg = colors.nord3 },
				b = { fg = colors.nord4, bg = colors.nord1 },
				c = { fg = colors.nord4, bg = colors.nord0 },
			},
		}
		require("lualine").setup({
			options = {
				theme = nord,
				component_separators = { left = "|", right = "|" },
				section_separators = { left = " ", right = " " },
			},
			sections = {
				lualine_a = { "branch", "diff" },
				lualine_b = { "filename" },
				lualine_c = { "diagnostics" },
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
