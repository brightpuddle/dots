-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
return function()
	-- Sign column icons
	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
	local function on_attach(formatting)
		return function(client, buf)
			local k = vim.keymap
			client.resolved_capabilities.document_formatting = formatting or false
			client.resolved_capabilities.document_range_formatting = formatting or false
			vim.api.nvim_buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")

			k.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = buf })
			k.set("n", "K", vim.lsp.buf.hover, { buffer = buf })
			k.set("n", "gd", vim.lsp.buf.definition, { buffer = buf })
			k.set("n", "gr", vim.lsp.buf.references, { buffer = buf })
		end
	end

	local lsp = require("lspconfig")
	-- local w_coq = require("coq").lsp_ensure_capabilities
	local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
	local function settings(format)
		if format == nil then
			format = false
		end
		return {
			capabilities = capabilities,
			on_attach = on_attach(format),
		}
	end
	lsp.pyright.setup(settings())
	lsp.rust_analyzer.setup(settings())
	lsp.tsserver.setup(settings())
	lsp.gopls.setup(settings())
	lsp.html.setup(settings())
	lsp.jsonls.setup(settings())
	lsp.cssls.setup(settings())
	lsp.eslint.setup(settings())
	lsp.sumneko_lua.setup({
		capabilities = capabilities,
		on_attach = on_attach(false),
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	})
end
