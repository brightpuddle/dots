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

		-- TODO
		-- Google Keep integration???
		-- https://github.com/stevearc/gkeep.nvim

		-- TODO
		-- Testing
		-- https://github.com/rcarriga/neotest

		-- TODO
		-- Debugging
		-- https://github.com/mfussenegger/nvim-dap

		-- require module caching
		use({ "lewis6991/impatient.nvim" })

		-- Pretty menus
		use({ "stevearc/dressing.nvim" })

		use({
			"folke/which-key.nvim",
			config = require("config.whichkey"),
			-- opt = true,
		})

		-- faster filetypes
		use({ "nathom/filetype.nvim" })

		-- delete buffer or quit (consistent cmd-w)
		use({ "ojroques/nvim-bufdel" })

		-- tmux split integration
		-- use({ "christoomey/vim-tmux-navigator" })
		use({ "alexghergh/nvim-tmux-navigation", config = require("config.nav") })

		-- startup time analysis
		use({ "dstein64/vim-startuptime", cmd = "StartupTime" })

		-- auto-pair closures
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

		-- use sad for project-wide find/replace
		use({ "ray-x/sad.nvim", requires = "ray-x/guihua.lua", cmd = "Sad" })

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
		use({ "arcticicestudio/nord-vim", config = require("config.color") })

		-- "tab" line with buffers
		use({
			"akinsho/bufferline.nvim",
			tag = "*",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = require("config.bufferline"),
		})

		-- syntax highlighting, etc
		use({ "nvim-treesitter/nvim-treesitter", config = require("config.treesitter") })

		-- view syntax tree
		use({ "nvim-treesitter/playground" })

		use({
			"feline-nvim/feline.nvim",
			config = require("config.feline"),
			after = { "nord-vim" },
		})

		-- quickfix/problem viewer
		use({
			"folke/trouble.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("trouble").setup()
			end,
			-- cmd = { "TroubleToggle" },
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
			config = function()
				require("gitsigns").setup({ signcolumn = false })
			end,
			-- cmd = "Gitsigns",
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

		-- file/directory tree
		use({
			"kyazdani42/nvim-tree.lua",
			requires = { "kyazdani42/nvim-web-devicons" },
			cmd = "NvimTreeToggle",
			config = require("config.nvimtree"),
		})

		-- fzf/CtrlP
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
				{ "nvim-lua/plenary.nvim" },
				{ "kyazdani42/nvim-web-devicons" },
			},
			cmd = { "Telescope" },
			config = require("config.telescope"),
		})

		-- Better search highlighting
		-- use({ "wincent/loupe" })
		-- use({ "qxxxb/vim-searchhi" })

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
			-- config = require("config.null_ls"),
		})

		-- LSP
		use({
			"neovim/nvim-lspconfig",
			config = require("config.lsp"),
		})

		-- proper formatting (harder than it should be)
		use({ "lukas-reineke/lsp-format.nvim" })

		-- symbol outline (uses LSP)
		use({ "simrat39/symbols-outline.nvim", cmd = "SymbolsOutline" })

		-- Javascript / JSX
		use({ "yuezk/vim-js", ft = { "javascript", "javascriptreact" } })
		use({ "maxmellon/vim-jsx-pretty", ft = { "javascript", "javascriptreact" } })

		-- Go
		use({
			"fatih/vim-go",
			run = ":GoInstallBinaries",
			cmd = { "GoInstallBinaries", "GoDoc" },
		})

		-- Markdown
		use({
			"preservim/vim-markdown",
			requires = "godlygeek/tabular",
			ft = { "markdown" },
		})

		-- Jinja
		use({ "lepture/vim-jinja", ft = { "jinja", "html.jinja" } })

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
