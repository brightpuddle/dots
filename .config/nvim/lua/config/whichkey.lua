return function()
	require("which-key").setup({
		icons = {
			breadcrumb = "»",
			separator = "  ",
			group = "+",
		},
		hidden = {
			"<silent>",
			"<cmd>",
			"<Cmd>",
			"<CR>",
			"call",
			"lua",
			"^:",
			"^ ",
		},
		triggers_blacklist = {
			i = { "j", "k" },
			v = { "j", "k" },
		},
	})
end
