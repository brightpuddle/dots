return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"neovim/nvim-lspconfig",
		{
			"williamboman/mason.nvim",
			build = function()
				pcall(vim.cmd, "MasonUpdate")
			end,
		},
		"williamboman/mason-lspconfig.nvim",
		{
			"jay-babu/mason-null-ls.nvim",
			dependencies = {
				"jose-elias-alvarez/null-ls.nvim",
				dependencies = "nvim-lua/plenary.nvim",
			},
		},
		"hrsh7th/nvim-cmp",
	},
	init = function()
		vim.diagnostic.config({
			virtual_text = false,
			signs = true,
			underline = false,
			update_in_insert = false,
			severity_sort = false,
		})
	end,
	config = function()
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
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
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
					"css",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
				},
				["robotframework_ls"] = { "robot" },
			},
		})
		-- require("mason").setup()
		-- require("mason-lspconfig").setup()

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
	end,
}

-- {
-- 	"neovim/nvim-lspconfig",
-- 	lazy = true,
-- 	dependencies = {
-- 		"jose-elias-alvarez/null-ls.nvim",
-- 		"hrsh7th/nvim-cmp",
-- 		"lukas-reineke/lsp-format.nvim",
-- 	},
-- 	config = require("config.lsp"),
-- },
