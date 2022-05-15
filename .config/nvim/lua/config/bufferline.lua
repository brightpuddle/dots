return function()
	require("bufferline").setup({
		highlights = {
			fill = { guibg = "#20252e" },
		},
		options = {
			always_show_bufferline = true,
			sort_by = "id",
			show_close_icon = false,
			offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" } },
			diagnostics = "nvim_lsp",
		},
	})
end
