return {
	"zbirenbaum/copilot.lua",
	cmd = { "Copilot" },
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			-- suggestion = { enabled = false },
			-- panel = { enabled = false },
			auto_refresh = true,
			suggestion = {
				auto_trigger = true,
			},
		})
	end,
	-- lazy = false,
}
