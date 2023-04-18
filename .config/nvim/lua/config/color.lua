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

return function()
	vim.cmd.colorscheme("nord")

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

	-- General visibility
	vim.api.nvim_set_hl(0, "Comment", { fg = "#616e88", italic = 1 })
	vim.api.nvim_set_hl(0, "Keyword", { fg = "#B48EAD" })
	vim.api.nvim_set_hl(0, "Number", { fg = "#D08770" })
	vim.api.nvim_set_hl(0, "Float", { link = "Number" })
	vim.api.nvim_set_hl(0, "Boolean", { link = "Number" })

	-- Cursorline
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "#282E39", fg = "#282E39" })
	vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#282E39", fg = "#282E39" })

	-- SymbolBrowser
	vim.api.nvim_set_hl(0, "FocusedSymbol", { fg = "#D08770", bold = 1 })

	-- Neotree
	vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = "#3B4252" })
	vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#282E39" })
	vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#282E39" })
	vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#2E3440", bg = "#2E3440" })

	-- Trouble
	vim.api.nvim_set_hl(0, "TroubleNormal", { bg = "#282E39" })

	-- Cokeline
	vim.api.nvim_set_hl(0, "TabLine", { bg = "#2E3440" })
end
