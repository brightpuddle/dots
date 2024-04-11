return {
	"hadronized/hop.nvim",
	branch = "v2",
	config = function()
		local hop = require("hop")
		local dir = require("hop.hint").HintDirection
		local k = vim.keymap
		hop.setup()
		k.set({ "n", "v" }, "<leader><leader>f", function()
			hop.hint_char1({ direction = dir.AFTER_CURSOR, current_line_only = true })
		end, { remap = true })
		k.set({ "n", "v" }, "<leader><leader>F", function()
			hop.hint_char1({ direction = dir.BEFORE_CURSOR, current_line_only = true })
		end, { remap = true })
		k.set({ "n", "v" }, "<leader><leader>j", function()
			hop.hint_char1({ direction = dir.AFTER_CURSOR, current_line_only = false })
		end, { remap = true })
		k.set({ "n", "v" }, "<leader><leader>k", function()
			hop.hint_char1({ direction = dir.BEFORE_CURSOR, current_line_only = false })
		end, { remap = true })
	end,
}
