return {
	-- Enable LazyVim plugins
	{ "LazyVim/LazyVim" },
	-- Close tab, buffer, or neovim
	{ "ojroques/nvim-bufdel" },
	-- Comment mgmt
	{ "tpope/vim-commentary", event = "BufEnter" },
	-- HTML tag managment using Treesitter
	{ "windwp/nvim-ts-autotag", event = { "BufEnter" } },
	-- Indent guides
	{ "lukas-reineke/indent-blankline.nvim", ft = { "python" } },
	-- Cross-project find / replace
	{ "ray-x/sad.nvim", dependencies = "ray-x/guihua.lua", cmd = "Sad" },
	-- Faster insert exit
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup({ mapping = { "jk" } })
		end,
	},
	-- Colorize hex codes
	{
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggle",
	},
}
