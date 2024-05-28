return {
	"mcchrish/zenbones.nvim",
	dependencies = { "rktjmp/lush.nvim" },
	lazy = false,
	priority = 1000,
	config = function()
		require("theme")()
		vim.cmd.colorscheme("zenwritten")
	end,
}
