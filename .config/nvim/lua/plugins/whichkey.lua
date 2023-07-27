return {
	"folke/which-key.nvim",
	config = function()
		require("which-key").setup({
			icons = {
				breadcrumb = "»",
				separator = "  ",
				group = "+",
			},
			hidden = {
				"<silent>",
				"<cmd>",
				"<Cmd>",
				"<CR>",
				"call",
				"lua",
				"^:",
				"^ ",
			},
			triggers_blacklist = {
				i = { "j", "k" },
				v = { "j", "k" },
			},
		})
		local wk = require("which-key")
		wk.register({
			["<leader>"] = {
				-- ["<leader>"] = {
				-- 	name = "Easymotion",
				-- 	w = { "<cmd>HopWord<cr>", "Hop line" },
				-- 	j = { "<cmd>HopWordAC<cr>", "Word down" },
				-- 	k = { "<cmd>HopWordBC<cr>", "Word up" },
				-- },
				f = {
					name = "Find",
					a = { "<cmd>Telescope<cr>", "Find all" },
					b = { "<cmd>Telescope buffers<cr>", "Find buffers" },
					c = { "<cmd>Telescope commands<cr>", "Find commands" },
					f = { "<cmd>Telescope find_files<cr>", "Find files" },
					g = { "<cmd>Telescope live_grep<cr>", "Find in files" },
					t = { "<cmd>Telescope tags<cr>", "Find tags" },
					s = { "<cmd>Telescope lsp_document_symbols<cr>", "Find symbols" },
				},
				w = {
					name = "Window",
					h = { "<cmd>NavigatorLeft<cr>", "Window left" },
					j = { "<cmd>NavigatorDown<cr>", "Window down" },
					k = { "<cmd>NavigatorUp<cr>", "Window up" },
					l = { "<cmd>NavigatorRight<cr>", "Window right" },
				},
			},
		})
	end,
}
