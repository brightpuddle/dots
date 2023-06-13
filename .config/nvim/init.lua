vim.loader.enable()

local g = vim.g

------------------------------------------------------------
-- Disable unused builtins
------------------------------------------------------------
-- g.loaded_gzip = 1
-- g.loaded_zip = 1
-- g.loaded_zipPlugin = 1
-- g.loaded_tar = 1
-- g.loaded_tarPlugin = 1

g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_2html_plugin = 1

-- g.loaded_matchit = 1
-- g.loaded_matchparen = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1

g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

------------------------------------------------------------
-- NVIM settings
------------------------------------------------------------
vim.g.mapleader = " "

local o = vim.o
o.autoindent = true
o.cb = "unnamed"
o.copyindent = true
-- o.cursorline = true
o.backup = false
o.expandtab = true
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldenable = false
o.grepprg = "rg --color=never"
o.guicursor = "a:blinkon0,i:ver25-iCursor"
o.ignorecase = true
o.laststatus = 3
o.cmdheight = 0
o.linebreak = true
o.mouse = "a"
o.number = true
o.shiftround = true
o.shiftwidth = 2
o.shortmess = o.shortmess .. "c"
o.shortmess = o.shortmess .. "I"
o.showcmd = false
o.swapfile = false
o.syntax = true
o.signcolumn = "number"
o.smartcase = true
o.softtabstop = 2
o.tabstop = 2
o.termguicolors = true
o.ttimeoutlen = 1
o.wildignore = ".DS_Store"
o.wildmode = "list:longest,full"
o.writebackup = false

vim.cmd([[set t_vb=]])
vim.g.loaded_python_provider = 1
vim.g.python3_host_prog = "/Users/nathan/.local/share/zinit/plugins/pyenv---pyenv/shims/python"
vim.g.python_host_skip_check = 1
vim.g.python3_host_skip_check = 1
o.pyxversion = 3

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = false,
	update_in_insert = false,
	severity_sort = false,
})

-- Nord colorscheme settings
g.nord_contrast = true
g.nord_borders = true
g.nord_enable_sidebar_background = true
g.nord_italic = false

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	-- Measure startup time
	{ "dstein64/vim-startuptime", cmd = "StartupTime" },
	-- Close tab, buffer, or neovim
	{ "ojroques/nvim-bufdel" },
	-- tmux navigation
	{ "numToStr/Navigator.nvim", config = require("config.nav") },
	-- Comment mgmt
	{ "tpope/vim-commentary", event = "BufEnter" },
	-- HTML tag managment using Treesitter
	{ "windwp/nvim-ts-autotag", event = { "BufEnter" } },
	-- Key help
	{ "folke/which-key.nvim", config = require("config.whichkey") },
	-- Indent guides
	{ "lukas-reineke/indent-blankline.nvim", ft = { "python" } },
	-- Cross-project find / replace
	{ "ray-x/sad.nvim", dependencies = "ray-x/guihua.lua", cmd = "Sad" },
	-- Synatx highlighting / awareness
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		config = require("config.treesitter"),
	},
	-- Treesitter syntax preview
	{ "nvim-treesitter/playground", lazy = true },

	-- Edit surrounds
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	-- Faster insert exit
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup({ mapping = { "jk" } })
		end,
	},

	-- Close surrounds
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},

	-- Testing
	{
		"nvim-neotest/neotest",
		lazy = true,
		dependencies = {
			"antoinemadec/FixCursorHold.nvim",
		},
	},
	-- Debugging
	{ "rcarriga/nvim-dap-ui", lazy = true, dependencies = { "mfussenegger/nvim-dap" } },

	-- Colorscheme
	{ "nordtheme/vim", as = "nord", config = require("config.color") },

	-- "Easymotion"
	{
		"phaazon/hop.nvim",
		event = "BufEnter",
		branch = "v1",
		cmd = { "HopWord", "HopWordAC", "HopWordBC" },
		config = require("config.hop"),
	},

	------------------------------------------------------------
	-- UI components / utilities
	------------------------------------------------------------

	-- Colorize hex codes
	{
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggle",
	},

	-- File / Directory tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		config = require("config.neotree"),
	},

	-- git
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup({ signcolumn = false })
		end,
	},

	-- Symbol browser
	{
		"simrat39/symbols-outline.nvim",
		cmd = { "SymbolsOutline" },
		dependencies = { "VonHeikemen/lsp-zero.nvim" },
		config = function()
			require("symbols-outline").setup()
		end,
	},

	-- Buffer bar
	{
		"willothy/nvim-cokeline",
		event = "BufEnter",
		dependencies = { "nvim-tree/nvim-web-devicons", "nordtheme/vim" },
		config = require("config.cokeline"),
	},

	-- Status bar
	{
		"freddiehaddad/feline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "nordtheme/vim" },
		event = "BufEnter",
		config = require("config.feline"),
	},

	-- Quickfix / Problem viewer
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- fzf/CtrlP
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"VonHeikemen/lsp-zero.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		cmd = { "Telescope" },
		config = require("config.telescope"),
	},

	-- Highlight and search for todo tags
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "TodoTrouble", "TodoTelescope" },
		config = require("config.todo_comments"),
	},

	------------------------------------------------------------
	-- LSP / language intelligence
	------------------------------------------------------------
	-- Simplified LSP / completion config
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" },
			{ "jay-babu/mason-null-ls.nvim", dependencies = "jose-elias-alvarez/null-ls.nvim" },
			{ "hrsh7th/nvim-cmp" },
		},
	},
	-- autocomplete
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		dependencies = {
			{ "saadparwaiz1/cmp_luasnip", dependencies = "L3MON4D3/LuaSnip" },
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
		},
		config = require("config.cmp"),
	},

	-- Github AI
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				auto_refresh = true,
				suggestion = {
					auto_trigger = true,
				},
			})
		end,
	},

	-- LSP for CLI tools
	{
		"jose-elias-alvarez/null-ls.nvim",
		lazy = true,
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- LSP configs
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			"hrsh7th/nvim-cmp",
			"lukas-reineke/lsp-format.nvim",
		},
		config = require("config.lsp"),
	},

	------------------------------------------------------------
	-- Languges (alaphabetical)
	------------------------------------------------------------
	{ "ray-x/go.nvim", ft = { "go" } },
	-- Javascript / Typescript
	{
		"yuezk/vim-js",
		ft = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
	},
	-- JSX / TSX
	{
		"maxmellon/vim-jsx-pretty",
		ft = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
	},
	-- Jinja
	{ "Glench/Vim-Jinja2-Syntax", ft = { "jinja", "html.jinja" } },
	-- Markdown
	{
		"preservim/vim-markdown",
		dependencies = "godlygeek/tabular",
		ft = { "markdown" },
	},
	-- Nginx
	{ "chr4/nginx.vim", ft = { "nginx" } },
	-- Robot
	{ "mfukar/robotframework-vim", ft = { "robot" } },
	-- Rust
	{
		"simrat39/rust-tools.nvim",
		ft = { "rust" },
		dependencies = {
			"neovim/nvim-lspconfig",
			"simrat39/rust-tools.nvim",
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
		},
	},
	-- Terraform
	{ "hashivim/vim-terraform", ft = { "terraform" } },
})

------------------------------------------------------------
-- Keybindings
------------------------------------------------------------

local k = vim.keymap
-- j/k for wrapped text
k.set({ "n", "v" }, "j", "gj", { silent = true })
k.set({ "n", "v" }, "k", "gk", { silent = true })

-- Save
k.set({ "n", "i" }, "<C-o>w", "<cmd>write<cr>", { silent = true })
-- Exit
k.set({ "n", "i" }, "<C-d>", "<cmd>BufDel<cr>", { silent = true })
-- Undo
k.set({ "n", "i" }, "<C-o>z", "<cmd>undo<cr>")
-- One window
k.set("n", "<leader>wo", "<cmd>only<cr>")
-- Copilot
k.set({ "n", "i" }, "<C-o>c", "<cmd>Copilot panel<cr>")

-- Buffer navigation
k.set("n", "<leader>]", "<cmd>bnext<cr>")
k.set("n", "<leader>[", "<cmd>bprev<cr>")
k.set("n", "L", "<cmd>bnext<cr>")
k.set("n", "H", "<cmd>bprev<cr>")
k.set({ "n", "i" }, "<C-o>n", "<cmd>bnext<cr>")
k.set({ "n", "i" }, "<C-o>p", "<cmd>bprev<cr>")

-- Incremental search
k.set("n", "<esc>", "<cmd>noh<cr>")
k.set("n", "\\", "<cmd>noh<cr>")
