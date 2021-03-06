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

	local lsp_format = require("lsp-format")
	lsp_format.setup({
		force = true,
		sync = false,
	})

	-- Buffer attach function
	local function on_attach(cfg)
		cfg = cfg or {}
		return function(client, bufnr)
			if cfg.format then
				lsp_format.on_attach(client, bufnr)
			end

			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

			local k = vim.keymap
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			k.set("n", "gD", vim.lsp.buf.declaration, bufopts)
			k.set("n", "gd", vim.lsp.buf.definition, bufopts)
			k.set("n", "K", vim.lsp.buf.hover, bufopts)
			k.set("n", "gi", vim.lsp.buf.implementation, bufopts)
			k.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
			k.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
			k.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
			k.set("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, bufopts)
			k.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
			k.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
			k.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
			k.set("n", "gr", vim.lsp.buf.references, bufopts)
			-- k.set("n", "<leader>f", vim.lsp.buf.formatting, bufopts)
		end
	end

	local lsp = require("lspconfig")
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
	local function config(format)
		return {
			on_attach = on_attach(format),
			capabilities = capabilities,
		}
	end

	lsp.pyright.setup(config())
	lsp.rust_analyzer.setup(config())
	lsp.tsserver.setup(config())
	lsp.gopls.setup(config())
	lsp.html.setup(config({ format = true }))
	lsp.jsonls.setup(config())
	lsp.cssls.setup(config())
	lsp.sumneko_lua.setup({
		on_attach = on_attach(),
		capabilities = capabilities,
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
	lsp.efm.setup({
		on_attach = on_attach({ format = true }),
		cmd = { "efm-langserver", "-logfile", "/tmp/efm.log", "-loglevel", "1" },
		init_options = { documentFormatting = true },
	})
end
