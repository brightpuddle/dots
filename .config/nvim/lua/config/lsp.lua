local k = vim.keymap

k.set({ "n", "i" }, "<C-o>j", "<cmd>TroubleToggle<cr>", { silent = true })
k.set("n", "<leader>oj", "<cmd>TroubleToggle<cr>")
k.set("n", "<leader>j", "<cmd>lua vim.diagnostic.goto_next()<cr>")
k.set("n", "<leader>k", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
k.set({ "n", "i" }, "<C-o>k", "<cmd>SymbolsOutline<cr>", { silent = true })
k.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
k.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })

return function()
	-- Sign column icons
	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	local lsp = require("lsp-zero").preset({})
	-- Buffer attach function
	lsp.on_attach(function(_, bufnr)
		lsp.default_keymaps({ buffer = bufnr })
	end)

	lsp.format_on_save({
		format_opts = {
			async = false,
			timeout_ms = 10000,
		},
		servers = {
			["ansiblels"] = { "ansible" },
			["html"] = { "html" },
			["null-ls"] = {
				"go",
				"jenkins",
				"json",
				"lua",
				"python",
				"rust",
				"terraform",
			},
			["robotframework_ls"] = { "robot" },
			["rome"] = {
				"css",
				"javascript",
				"typescript",
			},
		},
	})

	local lspconfig = require("lspconfig")
	lspconfig.lua_ls.setup({
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = { "vim", "hs" },
				},
			},
		},
	})

	lsp.setup()
	local null_ls = require("null-ls")
	require("mason-null-ls").setup({
		ensure_installed = {
			"golines",
			"revive",
		},
		automatic_installation = true,
		handlers = {},
	})
	null_ls.setup({
		sources = {
			-- Diagnostics
			null_ls.builtins.diagnostics.ansiblelint, -- Ansible
			null_ls.builtins.diagnostics.curlylint, -- Jinja, etc
			null_ls.builtins.diagnostics.flake8, -- Python
			null_ls.builtins.diagnostics.hadolint, -- Dockerfile
			null_ls.builtins.diagnostics.npm_groovy_lint, -- Jenkinsfile
			-- null_ls.builtins.diagnostics.revive, -- Go

			-- Formatting
			null_ls.builtins.formatting.black, -- Python
			null_ls.builtins.formatting.fixjson, -- JSON
			-- null_ls.builtins.formatting.golines, -- Go
			null_ls.builtins.formatting.isort, -- Python
			null_ls.builtins.formatting.npm_groovy_lint, -- Jenkinsfile
			null_ls.builtins.formatting.prettierd.with({
				filetypes = {
					"markdown",
					"yaml",
				},
			}),
			null_ls.builtins.formatting.rustfmt, -- Rust
			null_ls.builtins.formatting.shfmt, -- Shell
			null_ls.builtins.formatting.stylua, -- Lua
			null_ls.builtins.formatting.terraform_fmt, -- Terraform
			null_ls.builtins.formatting.trim_newlines,
			null_ls.builtins.formatting.trim_whitespace,
			null_ls.builtins.formatting.xmllint, -- XML
		},
	})
end
