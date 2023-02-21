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
		-- use {
		-- "nvim-neotest/neotest",
		-- requires = {
		-- "nvim-lua/plenary.nvim",
		-- "nvim-treesitter/nvim-treesitter",
		-- "antoinemadec/FixCursorHold.nvim"
		-- }
		-- }

		-- TODO
		-- Debugging
		-- https://github.com/mfussenegger/nvim-dap

		-- TODO
		-- Easier whichkey setup (need to test without first)
		-- https://github.com/AckslD/nvim-whichkey-setup.lua

		-- TODO
		-- Tmux and neovim splits
		-- https://github.com/declancm/windex.nvim

		-- module caching for "require" statements
		use({ "lewis6991/impatient.nvim" })

		-- pretty menus
		use({ "stevearc/dressing.nvim" })

		-- Keymaps
		use({
			"folke/which-key.nvim",
			config = require("config.whichkey"),
		})

		-- indent guides
		use({ "lukas-reineke/indent-blankline.nvim", ft = { "python" } })

		-- faster filetypes
		use({ "nathom/filetype.nvim", config = require("config.filetype") })

		-- base64 encode/decode
		use({ "taybart/b64.nvim" })

		-- delete buffer or quit (consistent cmd-w)
		use({ "ojroques/nvim-bufdel" })

		-- tmux split integration
		-- use({ "alexghergh/nvim-tmux-navigation", config = require("config.nav") })
		use({ "numToStr/Navigator.nvim", config = require("config.nav") })

		-- startup time analysis
		use({ "dstein64/vim-startuptime", cmd = "StartupTime" })

		-- auto-pair closures
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup()
			end,
		})
		-- autotag
		use({ "windwp/nvim-ts-autotag" })

		-- comment mgmt
		use("tpope/vim-commentary")

		-- edit surrounds
		use("tpope/vim-surround")

		-- use sad for project-wide find/replace
		use({ "ray-x/sad.nvim", requires = "ray-x/guihua.lua", cmd = "Sad" })

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
			opt = true,
			config = require("config.bufferline"),
		})

		-- syntax highlighting, etc
		use({ "nvim-treesitter/nvim-treesitter", config = require("config.treesitter") })

		-- treesitter syntax tree
		use({ "nvim-treesitter/playground" })

		-- status bar
		use({ "kyazdani42/nvim-web-devicons" })
		use({
			"feline-nvim/feline.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
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
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
			},
			config = require("config.neotree"),
		})
		-- use({
		-- 	"kyazdani42/nvim-tree.lua",
		-- 	requires = { "kyazdani42/nvim-web-devicons" },
		-- 	cmd = "NvimTreeToggle",
		-- 	config = require("config.nvimtree"),
		-- })

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
		})

		-- LSP
		use({
			"neovim/nvim-lspconfig",
			config = require("config.lsp"),
		})

		-- proper formatting (harder than it should be)
		use({ "lukas-reineke/lsp-format.nvim" })

		-- symbol outline (uses LSP)
		use({
			"simrat39/symbols-outline.nvim",
			cmd = "SymbolsOutline",
			config = function()
				require("symbols-outline").setup()
			end,
		})

		-- zen
		use({ "folke/zen-mode.nvim", cmd = { "ZenMode" }, config = require("config.zen") })

		-- languges (alaphabetical)
		-- crystal
		use({ "vim-crystal/vim-crystal", ft = { "crystal" } })
		-- go
		use({
			"ray-x/go.nvim",
			ft = { "go" },
			config = function()
				require("go").setup()
			end,
		})
		-- javascript / JSX
		use({
			"yuezk/vim-js",
			ft = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
			},
		})
		use({
			"maxmellon/vim-jsx-pretty",
			ft = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
			},
		})
		-- jinja
		use({ "Glench/Vim-Jinja2-Syntax", ft = { "jinja", "html.jinja" } })
		-- markdown
		use({
			"preservim/vim-markdown",
			requires = "godlygeek/tabular",
			ft = { "markdown" },
		})
		-- nginx
		use({ "chr4/nginx.vim", ft = { "nginx" } })
		-- robot
		use({ "mfukar/robotframework-vim", ft = { "robot" } })
		-- terraform
		use({ "hashivim/vim-terraform", ft = { "terraform" } })
		-- v
		use({ "ollykel/v-vim", ft = { "vlang" } })

		if PackerBootstrap then
			require("packer").sync()
		end
	end,
	config = {
		compile_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "plugin", "50-compiled.lua"),
		profile = {
			enable = true,
		},
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "none" })
			end,
		},
	},
})
