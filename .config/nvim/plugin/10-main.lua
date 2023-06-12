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
		use({ "wbthomason/packer.nvim" })
		use({ "dstein64/vim-startuptime", cmd = "StartupTime" })
		use({ "ojroques/nvim-bufdel" })
		use({ "numToStr/Navigator.nvim", config = require("config.nav") })
		use({ "lewis6991/impatient.nvim" })
		use({ "tpope/vim-commentary" })
		use({ "windwp/nvim-ts-autotag" })
		use({ "tpope/vim-surround" })
		use({ "folke/which-key.nvim", config = require("config.whichkey") })
		use({ "lukas-reineke/indent-blankline.nvim", ft = { "python" } })
		use({ "ray-x/sad.nvim", requires = "ray-x/guihua.lua", cmd = "Sad" })
		use({ "nvim-treesitter/nvim-treesitter", config = require("config.treesitter") })
		use({ "nvim-treesitter/playground" })

		use({
			"max397574/better-escape.nvim",
			config = function()
				require("better_escape").setup({ mapping = { "jk" } })
			end,
		})

		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup()
			end,
		})

		-- Testing
		use({
			"nvim-neotest/neotest",
			opt = true,
			requires = {
				"antoinemadec/FixCursorHold.nvim",
			},
		})
		-- Debugging
		use({ "rcarriga/nvim-dap-ui", opt = true, requires = { "mfussenegger/nvim-dap" } })

		-- fast jq using autocmds

		-- colorscheme
		use({ "nordtheme/vim", as = "nord", config = require("config.color") })

		use({
			"willothy/nvim-cokeline",
			requires = "kyazdani42/nvim-web-devicons",
			config = require("config.cokeline"),
			after = "nord",
		})

		-- status bar
		use({ "kyazdani42/nvim-web-devicons" })
		use({
			"freddiehaddad/feline.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = require("config.feline"),
			after = "nord",
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
				"nvim-tree/nvim-web-devicons",
				"MunifTanjim/nui.nvim",
			},
			cmd = "Neotree",
			config = require("config.neotree"),
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
				"onsails/lspkind.nvim",
				-- { "tzachar/cmp-tabnine", run = "./install.sh" },
			},
			config = require("config.cmp"),
		})

		-- LSP for CLI tooling
		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = "nvim-lua/plenary.nvim",
		})

		-- LSP pre-built configs
		use({
			"neovim/nvim-lspconfig",
			config = require("config.lsp"),
		})

		-- Proper formatting (harder than it should be)
		use({ "lukas-reineke/lsp-format.nvim" })

		-- Symbol outline (uses LSP)
		use({
			"simrat39/symbols-outline.nvim",
			cmd = "SymbolsOutline",
			config = function()
				require("symbols-outline").setup()
			end,
		})

		-- Languges (alaphabetical)
		-- Go
		use({
			"ray-x/go.nvim",
			ft = { "go" },
			config = function()
				require("go").setup()
			end,
		})
		-- Javascript/Typescript
		use({
			"yuezk/vim-js",
			ft = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
			},
		})
		-- JSX/TSX
		use({
			"maxmellon/vim-jsx-pretty",
			ft = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
			},
		})
		-- Jinja
		use({ "Glench/Vim-Jinja2-Syntax", ft = { "jinja", "html.jinja" } })
		-- Markdown
		use({
			"preservim/vim-markdown",
			requires = "godlygeek/tabular",
			ft = { "markdown" },
		})
		-- Nginx
		use({ "chr4/nginx.vim", ft = { "nginx" } })
		-- Robot
		use({ "mfukar/robotframework-vim", ft = { "robot" } })
		-- Rust
		use({
			"simrat39/rust-tools.nvim",
			requires = {
				"neovim/nvim-lspconfig",
				"simrat39/rust-tools.nvim",
				"nvim-lua/plenary.nvim",
				"mfussenegger/nvim-dap",
			},
		})
		-- Terraform
		use({ "hashivim/vim-terraform", ft = { "terraform" } })

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
