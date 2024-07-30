return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "canary",
	dependencies = {
		{ "zbirenbaum/copilot.lua" },
		{ "nvim-lua/plenary.nvim" },
	},
	cmd = { "Copilot", "CopilotChat" },
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			auto_refresh = true,
			suggestion = {
				auto_trigger = true,
			},
		})
		require("CopilotChat").setup({
			debug = true,
		})
	end,
}

-- return {
-- 	"zbirenbaum/copilot.lua",
-- 	cmd = "Copilot",
-- 	event = "InsertEnter",
-- }
