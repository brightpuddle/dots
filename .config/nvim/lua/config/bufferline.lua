return function()
	require("bufferline").setup({
		options = {
			-- always_show_bufferline = true,
			separator_style = { "", "" },
			-- sort_by = "id",
			-- mode = "tabs",
			show_close_icon = false,
			offsets = {
				{ filetype = "neo-tree", text = "", padding = 1 },
				{ filetype = "Outline", text = "", padding = 1 },
			},
			diagnostics = "nvim_lsp",
		},
	})
end
