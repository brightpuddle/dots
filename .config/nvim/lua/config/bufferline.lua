return function()
	require("bufferline").setup({
		options = {
			always_show_bufferline = true,
			sort_by = "id",
			-- mode = "tabs",
			show_close_icon = false,
			offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" } },
			diagnostics = "nvim_lsp",
		},
	})
end
