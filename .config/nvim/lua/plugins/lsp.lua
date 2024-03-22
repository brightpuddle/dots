return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"lukas-reineke/lsp-format.nvim",
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
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				"williamboman/mason.nvim",
				"nvimtools/none-ls.nvim",
			},
		},
		{
			"nvimtools/none-ls.nvim",
			dependencies = {
				"nvimtools/none-ls.nvim",
				dependencies = "nvim-lua/plenary.nvim",
			},
		},
		"hrsh7th/nvim-cmp",
	},
	config = function()
		vim.diagnostic.config({
			virtual_text = false,
			signs = true,
			underline = false,
			update_in_insert = false,
			severity_sort = false,
		})

		local lsp_zero = require("lsp-zero")

		lsp_zero.on_attach(function(_, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
		end)

		-- Sign column icons
		lsp_zero.set_sign_icons({
			error = "✘",
			warn = "▲",
			hint = "⚑",
			info = "»",
		})

		-- Format on save
		lsp_zero.format_on_save({
			format_opts = {
				async = false,
				timeout_ms = 10000,
			},
			servers = {
				["null-ls"] = {
					"go",
					"groovy",
					"javascript",
					"javascriptreact",
					"json",
					"lua",
					"markdown",
					"python",
					"rust",
					"terraform",
					"typescript",
					"typescriptreact",
					"yaml",
				},
				["templ"] = { "templ" },
				["ansiblels"] = { "ansible" },
				["cssls"] = { "css", "scss" },
				["html"] = { "html" },
				["jsonls"] = { "json" },
				["robotframework_ls"] = { "robot" },
				-- ["ruff_lsp"] = { "python" },
				["rust_analyzer"] = { "rust" },
				["terraformls"] = { "terraform" },
				-- ["tsserver"] = { "typescript", "typescriptreact" },
				["yamlls"] = { "yaml" },
			},
		})

		-- Auto-install
		require("mason").setup({})
		require("mason-lspconfig").setup({
			handlers = {
				lsp_zero.default_setup,
			},
		})

		-- Language Servers
		local lspconfig = require("lspconfig")
		lspconfig.gopls.setup({
			gopls_cmd = { "$HOME/go/bin/gopls" },
			fillstruct = "gopls",
			dap_debug = true,
			dap_debug_gui = true,
		})
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
		lspconfig.pyright.setup({
			settings = {
				pyright = {
					disableOrganizeImports = true,
				},
			},
		})

		-- Null setup
		local null_ls = require("null-ls")
		require("mason-null-ls").setup({
			automatic_installation = true,
			handlers = {
				prettierd = null_ls.register(null_ls.builtins.formatting.prettierd.with({
					filetypes = {
						"css",
						"markdown",
						"scss",
						"yaml",
					},
				})),
			},
		})
		null_ls.setup({
			root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "go.mod", "Makefile", ".git"),
		})
	end,
}
