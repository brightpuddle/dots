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
	local colors = require("base16-colorscheme").colors
	local c = {
		pri = {
			bg = colors.base01,
			fg = colors.base04,
		},
		sec = {
			bg = "#414a53",
			fg = colors.base03,
		},
	}
	local sep = {
		str = "ǀ",
		hl = { fg = colors.base03 },
		left = "left_rounded",
		right = "right_rounded",
	}
	local vi_mode = require("feline.providers.vi_mode")
	local lsp = require("feline.providers.lsp")

	local main_icon = {
		provider = " ",
		hl = function()
			return {
				bg = vi_mode.get_mode_color(),
				fg = colors.base00,
			}
		end,
		right_sep = function()
			return {
				str = sep.right,
				hl = { bg = c.sec.bg, fg = vi_mode.get_mode_color() },
			}
		end,
	}

	local file_name = {
		provider = "file_info",
		hl = { style = "italic" },
		right_sep = " ",
		left_sep = " ",
	}

	local file_type = {
		provider = "file_type",
		icon = function()
			if lsp.is_lsp_attached() then
				return "  "
			end
			return ""
		end,
		right_sep = " ",
		left_sep = " ",
	}

	local folder_name = {
		provider = function()
			return vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
		end,
		icon = { str = "  " },
		hl = { bg = c.sec.bg },
		right_sep = sep.right,
	}

	local git = {
		branch = {
			provider = "git_branch",
			left_sep = { str = sep.str .. " ", hl = sep.hl },
			truncate_hide = true,
		},
		add = {
			provider = "git_diff_added",
			icon = "+",
			hl = { fg = colors.base0B },
			left_sep = " ",
			truncate_hide = true,
		},
		change = {
			provider = "git_diff_changed",
			icon = "~",
			hl = { fg = colors.base0C },
			left_sep = " ",
			truncate_hide = true,
		},
		remove = {
			provider = "git_diff_removed",
			icon = "-",
			hl = { fg = colors.base08 },
			left_sep = " ",
			truncate_hide = true,
		},
	}

	local diag = {
		sep = {
			provider = function(component)
				if
					lsp.diagnostics_exist(1)
					or lsp.diagnostics_exist(2)
					or lsp.diagnostics_exist(3)
					or lsp.diagnostics_exist(4)
				then
					component.hl = sep.hl
					return sep.str
				end
				return ""
			end,
		},
		err = {
			provider = "diagnostic_errors",
			hl = { fg = colors.base08 },
			right_sep = " ",
		},
		warn = {
			provider = "diagnostic_warnings",
			hl = { fg = colors.base0A },
			right_sep = " ",
		},
		info = {
			provider = "diagnostic_info",
			hl = { fg = colors.base0C },
			right_sep = " ",
		},
		hint = {
			provider = "diagnostic_hints",
			hl = { fg = colors.base0E },
			right_sep = " ",
		},
	}

	local cursor = require("feline.providers.cursor")
	local position = {
		provider = " " .. cursor.position(nil, { padding = true }) .. " ",
		hl = function()
			return {
				bg = vi_mode.get_mode_color(),
				fg = colors.base00,
			}
		end,
		left_sep = function()
			return {
				str = sep.left,
				hl = { bg = c.sec.bg, fg = vi_mode.get_mode_color() },
			}
		end,
	}

	local line_percentage = {
		provider = function()
			return " " .. cursor.line_percentage() .. " "
		end,
		hl = { bg = c.sec.bg },
		left_sep = sep.left,
	}

	require("feline").setup({
		components = {
			active = {
				{
					main_icon,
					folder_name,
					file_name,
					git.branch,
					git.add,
					git.change,
					git.remove,
				},
				{},
				{
					diag.err,
					diag.warn,
					diag.hint,
					diag.info,
					diag.sep,
					file_type,
					line_percentage,
					position,
				},
			},
			inactive = {
				{ main_icon, file_name },
				{},
				{ line_percentage, position },
			},
		},
		theme = {
			bg = c.pri.bg,
			fg = c.pri.fg,
		},
		vi_mode_colors = {
			-- Normal
			NORMAL = colors.base0B,
			OP = colors.base0B,
			-- Insert
			INSERT = colors.base0C,
			-- Visual modes
			VISUAL = colors.base0E,
			LINES = colors.base0E,
			BLOCK = colors.base0E,
			-- Replace
			REPLACE = colors.base08,
			["V-REPLACE"] = colors.base08,
			ENTER = colors.base0D,
			MORE = colors.base0D,
			SELECT = colors.base09,
			COMMAND = colors.base09,
			SHELL = colors.base0B,
			TERM = colors.base0C,
			NONE = colors.base0A,
		},
	})
end
