return function()
	require("Navigator").setup()
	local k = vim.keymap
	-- local nav = require("nvim-tmux-navigation")

	k.set("n", "<leader>wh", "<cmd>NavigatorLeft<cr>")
	k.set("n", "<leader>wj", "<cmd>NavigatorDown<cr>")
	k.set("n", "<leader>wk", "<cmd>NavigatorUp<cr>")
	k.set("n", "<leader>wl", "<cmd>NavigatorRight<cr>")
	k.set({ "n", "i" }, "<C-w>h", "<cmd>NavigatorLeft<cr>")
	k.set({ "n", "i" }, "<C-w>j", "<cmd>NavigatorDown<cr>")
	k.set({ "n", "i" }, "<C-w>k", "<cmd>NavigatorUp<cr>")
	k.set({ "n", "i" }, "<C-w>l", "<cmd>NavigatorRight<cr>")
	k.set({ "n", "i" }, "<C-h>", "<cmd>NavigatorLeft<cr>")
	k.set({ "n", "i" }, "<C-j>", "<cmd>NavigatorDown<cr>")
	k.set({ "n", "i" }, "<C-k>", "<cmd>NavigatorUp<cr>")
	k.set({ "n", "i" }, "<C-l>", "<cmd>NavigatorRight<cr>")
end
