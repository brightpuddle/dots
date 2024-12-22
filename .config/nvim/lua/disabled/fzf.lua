return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- config = function()
	-- 	require("fzf-lua").setup({ "default" })
	-- end,
	cmd = "FzfLua",
	keys = {
		{ "<C-f>", "<cmd>FzfLua files<cr>", desc = "Find", mode = { "n", "i" } },
		{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Files" },
		{ "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
		{ "<leader>fg", "<cmd>FzfLua grep<cr>", desc = "Grep" },
		{ "<leader>ft", "<cmd>FzfLua tags<cr>", desc = "Tags" },
		{ "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Symbols" },
		{ "<leader>fd", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Diagnostics" },
	},
}
