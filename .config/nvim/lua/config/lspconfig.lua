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
	-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	-- 	underline = false,
	-- 	virtual_text = false,
	-- 	update_in_insert = false,
	-- })
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
	local default = {
		capabilities = capabilities,
		on_attach = on_attach(false),
	}
	lsp.pyright.setup(default)
	lsp.rust_analyzer.setup(default)
	lsp.tsserver.setup(default)
	lsp.gopls.setup(default)
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
