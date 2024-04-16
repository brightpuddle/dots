return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},
		{
			"R",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Treesitter Search",
		},
		{
			"<c-s>",
			mode = { "c" },
			function()
				require("flash").toggle()
			end,
			desc = "Toggle Flash Search",
		},
	},
	modes = {
		search = {
			enabled = false,
		},
	},
}
-- local k = vim.keymap
-- k.set({ "n", "v" }, "<leader><leader>f", function()
-- 	hop.hint_char1({ direction = dir.AFTER_CURSOR, current_line_only = true })
-- end, { remap = true })
-- k.set({ "n", "v" }, "<leader><leader>F", function()
-- 	hop.hint_char1({ direction = dir.BEFORE_CURSOR, current_line_only = true })
-- end, { remap = true })
-- k.set({ "n", "v" }, "<leader><leader>j", function()
-- 	hop.hint_char1({ direction = dir.AFTER_CURSOR, current_line_only = false })
-- end, { remap = true })
-- k.set({ "n", "v" }, "<leader><leader>k", function()
-- 	hop.hint_char1({ direction = dir.BEFORE_CURSOR, current_line_only = false })
-- end, { remap = true })
