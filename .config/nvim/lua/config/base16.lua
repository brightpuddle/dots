-- base00 = #2b303b
-- base01 = #343d46
-- base02 = #4f5b66
-- base03 = #65737e
-- base04 = #a7adba
-- base05 = #c0c5ce
-- base06 = #dfe1e8
-- base07 = #eff1f5
-- base08 = #bf616a
-- base09 = #d08770
-- base0A = #ebcb8b
-- base0B = #a3be8c
-- base0C = #96b5b4
-- base0D = #8fa1b3
-- base0E = #b48ead
-- base0F = #ab7967

return function()
	local base16 = require("base16-colorscheme")

	base16.setup("ocean")

	local hi = base16.highlight
	local c = base16.colors

	-- -- Swap colors around with imports
	hi.TSInclude = { guifg = c.base08 }
	hi.TSNamespace = { guifg = c.base05 }

	-- Variables to default
	hi.TSVariable = { guifg = c.base05 }

	-- Builtin red
	hi.TSFuncBuiltin = { guifg = c.base08 }

	-- Darken line numbers
	hi.LineNr = { guifg = c.base02 }

	-- Give float a slightly lighter BG
	hi.NormalFloat = { guibg = c.base01 }

	-- Switch warnings to yellow instead of magenta
	hi.DiagnosticWarn = { guifg = c.base0A }

	-- Highlight active search item
	hi.SearchLight = { guibg = c.base09, guifg = c.base01 }
end
