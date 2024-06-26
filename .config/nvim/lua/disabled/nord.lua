-- Nord colors

-- NordNight
-- #2E3440
-- #3B4252
-- #434C5E
-- #4C566A

-- NordSnow
-- #D8DEE9
-- #E5E9F0
-- #ECEFF4

-- NordFrost
-- #8FBCBB
-- #88C0D0
-- #81A1C1
-- #5E81AC

-- NordAura
-- #BF616A
-- #D08770
-- #EBCB8B
-- #A3BE8C
-- #B48EAD
return {
	-- "casonadams/nord.vim",
	"nordtheme/vim",
	-- "shaunsingh/nord.nvim",
	-- "gbprod/nord.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("nord")
		local hl = vim.api.nvim_set_hl

		hl(0, "Normal", { bg = "none" })

		-- General visibility
		hl(0, "Comment", { fg = "#616e88", italic = 1 })
		hl(0, "Statement", { fg = "#B48EAD" })
		hl(0, "Number", { fg = "#D08770" })
		hl(0, "Float", { link = "Number" })
		hl(0, "Boolean", { link = "Number" })

		-- SymbolBrowser
		hl(0, "FocusedSymbol", { fg = "#D08770", bold = 1 })

		-- Neotree
		hl(0, "NeoTreeCursorLine", { bg = "#3B4252" })
		hl(0, "NeoTreeNormal", { bg = "#282E39" })
		hl(0, "NeoTreeNormalNC", { bg = "#282E39" })
		hl(0, "NeoTreeWinSeparator", { fg = "#2E3440", bg = "#2E3440" })

		-- -- Trouble
		hl(0, "TroubleNormal", { bg = "#282E39" })

		hl(0, "LineNr", { fg = "#4C566A" })

		-- NvimNotify
		hl(0, "NotifyBackground", { bg = "#434c5e" })

		-- Markdown headlines
		hl(0, "Headline1", { fg = "#88C0D0", bg = "#3d3c44", bold = true })
		hl(0, "Headline2", { fg = "#81A1C1", bg = "#3f4247", bold = true })
		hl(0, "Headline3", { fg = "#5E81AC", bg = "#394147", bold = true })
		hl(0, "Headline4", { fg = "#81A1C1", bg = "#363e4c", bold = true })
		hl(0, "Headline5", { fg = "#BF616A", bg = "#3a3c4a", bold = true })
		hl(0, "Headline6", { fg = "#D8DEE9", bg = "#3d434f", bold = true })
	end,
}
