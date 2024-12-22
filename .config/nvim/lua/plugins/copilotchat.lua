return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "main",
	dependencies = {
		{ "zbirenbaum/copilot.lua" },
		{ "nvim-lua/plenary.nvim" },
	},
	build = "make tiktoken",
	cmd = { "CopilotChat" },
	config = function()
		require("CopilotChat").setup()
	end,
	keys = {
		{ "<leader>sc", "<cmd>CopilotChat<cr>", desc = "Copilot Chat" },
	},
}
