local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PackerBootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

require("packer").startup({
	function(use)
		-- package management
		use({ "wbthomason/packer.nvim" })

		-- require module caching
		use({ "lewis6991/impatient.nvim" })

		-- Pretty menus
		use({ "stevearc/dressing.nvim" })

		use({
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup({})
			end,
		})

		-- faster filetypes
		use({ "nathom/filetype.nvim" })

		-- delete buffer or quit (consistent cmd-w)
		use({ "ojroques/nvim-bufdel" })

		-- tmux split integration
		use({ "christoomey/vim-tmux-navigator" })

		-- startup time analysis
		use({ "dstein64/vim-startuptime", cmd = "StartupTime" })

		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup()
			end,
		})

		-- comment mgmt
		use("tpope/vim-commentary")

		-- edit surrounds
		use("tpope/vim-surround")

		-- auto-close tags
		use({
			"alvan/vim-closetag",
			ft = {
				"html",
				"xml",
				"xhtml",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"reason",
				"rescript",
				"html.handlebars",
			},
			config = require("config.closetag"),
		})

		-- fast jq using autocmds
		use({
			"max397574/better-escape.nvim",
			config = function()
				require("better_escape").setup({ mapping = { "jk" } })
			end,
		})

		-- colorscheme
		use({
			"RRethy/nvim-base16",
			config = require("config.base16"),
		})

		-- "tab" line with buffers
		use({
			"akinsho/bufferline.nvim",
			tag = "*",
			requires = { "kyazdani42/nvim-web-devicons" },
			after = "nvim-base16",
			config = require("config.bufferline"),
		})

		-- syntax highlighting, etc
		use({ "nvim-treesitter/nvim-treesitter", config = require("config.treesitter") })

		-- view syntax tree
		use({ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" })

		use({ "feline-nvim/feline.nvim", after = "nvim-base16", config = require("config.feline") })

		-- quickfix/problem viewer
		use({
			"folke/trouble.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("trouble").setup()
			end,
		})

		-- zen mode
		use({
			"Pocco81/TrueZen.nvim",
			cmd = "TZAtaraxis",
			config = function()
				require("true-zen").setup()
			end,
		})

		-- colorize hex codes
		use({
			"norcalli/nvim-colorizer.lua",
			cmd = "ColorizerToggle",
			config = function()
				require("colorizer").setup()
			end,
		})

		-- git
		use({
			"lewis6991/gitsigns.nvim",
			cmd = "Gitsigns",
			config = function()
				require("gitsigns").setup({ signcolumn = false })
			end,
		})

		-- easymotion
		use({
			"phaazon/hop.nvim",
			branch = "v1",
			cmd = { "HopWord", "HopWordAC", "HopWordBC" },
			config = function()
				require("hop").setup()
			end,
		})

		-- fix search highlighting for current match
		use({ "PeterRincker/vim-searchlight" })

		-- file/directory tree
		use({
			"kyazdani42/nvim-tree.lua",
			requires = { "kyazdani42/nvim-web-devicons" },
			cmd = "NvimTreeToggle",
			config = function()
				require("nvim-tree").setup()
			end,
		})

		-- fzf/CtrlP
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
				{ "nvim-lua/plenary.nvim" },
				{ "kyazdani42/nvim-web-devicons" },
			},
			cmd = "Telescope",
			config = require("config.telescope"),
		})

		-- highlight and search for todo tags
		use({
			"folke/todo-comments.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			cmd = { "TodoTrouble", "TodoTelescope" },
			config = require("config.todo_comments"),
		})

		-- completion
		use({
			"hrsh7th/nvim-cmp",
			requires = {

				{ "saadparwaiz1/cmp_luasnip", requires = "L3MON4D3/LuaSnip" },
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				{ "tzachar/cmp-tabnine", run = "./install.sh" },
			},
			config = require("config.cmp"),
		})

		-- LS for non-LS tooling
		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = require("config.null_ls"),
		})

		-- LSP
		use({
			"neovim/nvim-lspconfig",
			config = require("config.lspconfig"),
		})

		-- symbol outline (uses LSP)
		use({ "simrat39/symbols-outline.nvim", cmd = "SymbolsOutline" })

		-- Javascript / JSX
		use({ "yuezk/vim-js", ft = { "javascript", "javascriptreact" } })
		use({ "maxmellon/vim-jsx-pretty", ft = { "javascript", "javascriptreact" } })

		-- Go
		use({
			"fatih/vim-go",
			cmd = { "GoInstallBinaries", "GoDoc" },
		})

		if PackerBootstrap then
			require("packer").sync()
		end
	end,
	config = {
		compile_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "plugin", "50-compiled.lua"),
		profile = {
			enable = true,
		},
		-- display = {
		-- 	open_fn = function()
		-- 		return require("packer.util").float({ border = "single" })
		-- 	end,
		-- },
	},
})
