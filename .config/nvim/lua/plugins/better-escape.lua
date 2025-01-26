-- Faster insert exit
return {
	"max397574/better-escape.nvim",
	event = "InsertEnter",
	config = function()
		require("better_escape").setup({
			mappings = {
				i = { j = {k = "<Esc>", j = "<Esc>"}},
				c = { j = { k = "<Esc>", j = "<Esc>"}},
				t = { j = { k = "<Esc>", j = "<Esc>"}},
				v = { j = { k = false}},
				s = { j = { k = "<Esc>"}},
			},
		})
	end,
}
