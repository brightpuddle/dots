return {
	"willothy/nvim-cokeline",
	event = "BufEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local hlgroups = require("cokeline.hlgroups")
		local C = {
			active = {
				fg = "#d8dee9",
				bg = "#3b4252",
			},
			inactive = {
				fg = "#d8dee9",
				bg = "#2e3440",
			},
			bg = "#2e3440",
			fg = "#d8dee9",
		}
		require("cokeline").setup({
			fill_hl = "Normal",
			show_if_buffers_are_at_least = 2,
			buffers = {
				-- filter_valid = function(buffer) -> true | false,
				-- filter_visible = function(buffer) -> true | false,
				-- focus_on_delete = 'prev' | 'next',
				-- new_buffers_position = 'last' | 'next' | 'directory' | 'number',
				-- delete_on_right_click = true | false,
			},
			-- rendering = {
			--   max_buffer_width = 999,
			-- },

			default_hl = {
				fg = function(buf)
					return buf.is_focused and C.active.fg or C.inactive.fg
				end,
				bg = function(buf)
					return buf.is_focused and C.active.bg or C.inactive.bg
				end,
				style = "NONE",
			},

			components = {
				{
					text = "",
					fg = function(buf)
						return buf.is_focused and C.active.bg or C.inactive.bg
					end,
					bg = C.bg,
				},
				{
					text = function(buf)
						return " " .. buf.devicon.icon
					end,
					fg = function(buf)
						return buf.devicon.color
					end,
				},
				{
					text = function(buf)
						return buf.filename .. " "
					end,
					style = function(buf)
						return buf.is_focused and "italic" or "none"
					end,
				},
				{
					text = "󰅖",
					delete_buffer_on_left_click = true,
				},
				{
					text = " ",
				},

				{
					text = "",
					fg = function(buf)
						return buf.is_focused and C.active.bg or C.inactive.bg
					end,
					bg = C.bg,
				},
				{
					text = " ",
					bg = C.bg,
				},
			},

			sidebar = {
				filetype = "neo-tree",
				components = {
					{
						text = "  NeoTree",
						fg = hlgroups.get_hl_attr("NeoTreeNormal", "fg"),
						bg = hlgroups.get_hl_attr("NeoTeeNormal", "bg"),
						style = "bold",
					},
				},
			},
		})
	end,
}
