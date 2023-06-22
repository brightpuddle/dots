return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "TodoTrouble", "TodoTelescope" },
	config = function()
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
	end,
}
