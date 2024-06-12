return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters = {
				vfmt = {
					command = "v",
					args = { "fmt" },
				},
			},
			formatters_by_ft = {
				go = { "gofumpt", "golines" },
				gohtmltmpl = { "djlint", "rustywind" },
				javascript = { "biome", "rustywind" },
				javascriptreact = { "biome", "rustywind" },
				json = { "fixjson" },
				lua = { "stylua" },
				python = { "isort", "ruff_fix", "ruff_format" },
				sh = { "shfmt" },
				templ = { "templ", "rustywind" },
				terraform = { "terraform_fmt" },
				toml = { "taplo" },
				v = { "vfmt" },
				xml = { "xmllint" },
				yaml = { "yamlfmt" },
			},
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 500, lsp_fallback = true }
			end,
		})

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}
