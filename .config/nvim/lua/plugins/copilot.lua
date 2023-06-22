return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			auto_refresh = true,
			suggestion = {
				auto_trigger = true,
			},
		})
	end,
}
