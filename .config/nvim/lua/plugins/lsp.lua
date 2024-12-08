return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "Mason" },
	dependencies = {
		"neovim/nvim-lspconfig",
		{
			"williamboman/mason.nvim",
			build = function()
				pcall(vim.cmd, "MasonUpdate")
			end,
		},
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
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
		{
			"SmiteshP/nvim-navbuddy",
			dependencies = {
				"SmiteshP/nvim-navic",
				"MunifTanjim/nui.nvim",
			},
			opts = { lsp = { auto_attach = true } },
		},
	},
	config = function()
		local lsp_zero = require("lsp-zero")
		-- local lsp_format = require("lsp-format")
		local navic = require("nvim-navic")
		vim.g.navic_silence = true
		require("nvim-navbuddy").setup()

		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })
			if client.server_capabilities.documentSymbolProvider then
				navic.attach(client, bufnr)
			end

			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					virtual_text = false,
				})
		end)

		-- Sign column icons
		lsp_zero.set_sign_icons({
			error = "✘",
			warn = "▲",
			hint = "⚑",
			info = "»",
		})
		local function lspSymbol(name, icon)
			vim.fn.sign_define("DiagnosticSign" .. name, { text = icon, numhl = "DiagnosticDefault" .. name })
		end
		lspSymbol("Error", "✘")
		lspSymbol("Information", "»")
		lspSymbol("Hint", "⚑")
		lspSymbol("Info", "»")
		lspSymbol("Warning", "▲")
		-- Diagnostics
		vim.diagnostic.config({
			virtual_text = false,
			signs = true,
			underline = false,
			update_in_insert = false,
			severity_sort = false,
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
		lspconfig.yamlls.setup({
			settings = {
				yaml = {
					customTags = {
						"!override sequence",
						"!reset sequence",
						"!env",
					},
				},
			},
		})

		-- None-LS setup
		local null_ls = require("null-ls")
		require("mason-null-ls").setup({
			automatic_installation = false,
			handlers = {},
		})
		null_ls.setup({
			root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "go.mod", "Makefile", ".git"),
		})

		-- Autopairs compatibility
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
