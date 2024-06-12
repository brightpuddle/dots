return {
	"mcchrish/zenbones.nvim",
	dependencies = { "rktjmp/lush.nvim" },
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.nord = {
			transparent_background = true,
		}
		vim.cmd.colorscheme("nord")
	end,
}
