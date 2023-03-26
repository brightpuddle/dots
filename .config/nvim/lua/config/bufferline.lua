return function()
	require("bufferline").setup({
		options = {
			always_show_bufferline = false,
			show_close_icon = true,
			offsets = {
				{ filetype = "neo-tree", text = "", padding = 1 },
				{ filetype = "Outline", text = "", padding = 1 },
			},
			diagnostics = "nvim_lsp",
		},
	})
end
