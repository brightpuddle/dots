return function()
	require("todo-comments").setup({
		-- signs = false,
		highlight = {
			pattern = [[<(KEYWORDS)>]],
			-- pattern = "NONE",
		},
		search = {
			pattern = [[\b(KEYWORDS)\b]],
		},
	})
end
