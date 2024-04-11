return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				go = { "gofumpt", "golines" },
				javascript = { "biome", "rustywind" },
				javascriptreact = { "biome", "rustywind" },
				json = { "fixjson" },
				lua = { "stylua" },
				python = { "isort", "ruff_fix", "ruff_format" },
				sh = { "shfmt" },
				templ = { "templ", "rustywind" },
				terraform = { "terraform_fmt" },
				toml = { "taplo" },
				xml = { "xmllint" },
				yaml = { "yamlfmt" },
				gohtmltmpl = { "djlint", "rustywind" },
			},
			format_on_save = {
				lsp_fallback = true,
			},
		})
	end,
}
