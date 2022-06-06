return function()
	local k = vim.keymap
	local nav = require("nvim-tmux-navigation")

	k.set("n", "<leader>wh", nav.NvimTmuxNavigateLeft)
	k.set("n", "<leader>wj", nav.NvimTmuxNavigateDown)
	k.set("n", "<leader>wk", nav.NvimTmuxNavigateUp)
	k.set("n", "<leader>wl", nav.NvimTmuxNavigateRight)
	k.set({ "n", "i" }, "<C-w>h", nav.NvimTmuxNavigateLeft)
	k.set({ "n", "i" }, "<C-w>j", nav.NvimTmuxNavigateDown)
	k.set({ "n", "i" }, "<C-w>k", nav.NvimTmuxNavigateUp)
	k.set({ "n", "i" }, "<C-w>l", nav.NvimTmuxNavigateRight)
end
