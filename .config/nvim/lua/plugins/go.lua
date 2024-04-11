return {
	"ray-x/go.nvim",
	config = function()
		require("go").setup()
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod", "gotexttmpl", "gohtmltmpl" },
	build = ':lua require("go.install").update_all_sync()',
}
