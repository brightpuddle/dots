local k = vim.keymap

k.set("n", "<C-p>", "<cmd>Telescope find_files<cr>")
k.set("n", "<C-o>fa", "<cmd>Telescope<cr>")
k.set("n", "<C-o>fb", "<cmd>Telescope buffers<cr>")
k.set("n", "<leader>ft", "<cmd>Telescope tags<cr>")
k.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
k.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
k.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
k.set("n", "<leader>fc", "<cmd>Telescope commands<cr>")
k.set("n", "<leader>fa", "<cmd>Telescope<cr>")

return function()
	require("telescope.actions")
	local trouble = require("trouble.providers.telescope")

	require("telescope").setup({
		defaults = {
			mappings = {
				i = { ["<C-o>j"] = trouble.open_with_trouble },
				n = { ["<C-o>j"] = trouble.open_with_trouble },
			},
		},
		pickers = {
			buffers = {
				theme = "dropdown",
			},
		},
	})
	require("telescope").load_extension("fzf")
end
