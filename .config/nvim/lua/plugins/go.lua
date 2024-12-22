-- Go language support
return {
	"ray-x/go.nvim",
	config = function()
		require("go").setup()
	end,
	ft = { "go", "gomod", "gotexttmpl", "gohtmltmpl" },
	build = ':lua require("go.install").update_all_sync()',
}
