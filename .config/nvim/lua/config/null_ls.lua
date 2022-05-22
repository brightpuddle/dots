-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
return function()
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	local null_ls = require("null-ls")
	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics
	local code_actions = null_ls.builtins.code_actions

	null_ls.setup({
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
						vim.lsp.buf.formatting_sync()
					end,
				})
			end
		end,
		sources = {
			-- Diagnostics
			diagnostics.flake8,
			diagnostics.revive,
			diagnostics.eslint_d,

			-- Code Actions
			code_actions.eslint_d,

			-- Formatting
			formatting.black,
			formatting.fixjson,
			formatting.golines,
			formatting.isort,
			formatting.prettierd.with({
				disabled_filetypes = {
					"javascript",
					"typescript",
					"json",
				},
			}),
			formatting.rome,
			formatting.rustfmt,
			formatting.shfmt,
			formatting.stylua,
			formatting.trim_newlines,
			formatting.trim_whitespace,
			formatting.xmllint,
		},
	})
end
