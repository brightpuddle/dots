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
	local vi_mode = require("feline.providers.vi_mode")
	local lsp = require("feline.providers.lsp")
	local git = require("feline.providers.git")
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
		block = "█",
		left = "",
		right = "",
		pri = "  ",
		sec = " ",
	}

	local comps = {}
	-- VIM mode
	comps.mode = {
		provider = function()
			return string.lower(string.sub(vi_mode.get_vim_mode(), 1, 2))
		end,
		-- provider = " ",
		hl = function()
			return {
				fg = vi_mode.get_mode_color(),
				style = "bold,italic",
			}
		end,
		left_sep = sep.sec,
		priority = 90,
	}

	-- File info
	comps.file = {
		folder = {
			provider = function()
				return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
			end,
			icon = { str = "  ", hl = { fg = colors.base03 } },
			left_sep = sep.pri,
			priority = 50,
		},
		filename = {
			provider = {
				name = "file_info",
				opts = {
					case = "lowercase",
					filetype_icon = true,
					file_readonly_icon = " ",
					type = "relative",
				},
			},
			short_provider = {
				name = "file_info",
				opts = {
					case = "lowercase",
					filetype_icon = true,
					file_readonly_icon = " ",
				},
			},
			hl = { style = "italic" },
			left_sep = { str = " / ", hl = { fg = colors.base03 } },
			priority = 50,
		},
	}

	-- Git
	comps.git = {
		branch = {
			provider = "git_branch",
			left_sep = sep.pri .. sep.left .. sep.block,
			hl = { bg = colors.base01 },
			truncate_hide = true,
			priority = 10,
		},
		add = {
			provider = "git_diff_added",
			icon = "+",
			hl = { fg = colors.base0B, bg = colors.base01 },
			left_sep = sep.block,
			truncate_hide = true,
			priority = 10,
		},
		change = {
			provider = "git_diff_changed",
			icon = "~",
			hl = { fg = colors.base0C, bg = colors.base01 },
			left_sep = sep.block,
			truncate_hide = true,
			priority = 10,
		},
		remove = {
			provider = "git_diff_removed",
			icon = "-",
			hl = { fg = colors.base08, bg = colors.base01 },
			left_sep = sep.block,
			truncate_hide = true,
			priority = 10,
		},
		sep = {
			provider = function()
				if git.git_info_exists() then
					return sep.block .. sep.right
				end
				return ""
			end,
			hl = { fg = colors.base01 },
			truncate_hide = true,
			priority = 10,
		},
	}

	-- Diagnostics
	comps.diag = {
		status = {
			provider = function()
				if lsp.is_lsp_attached() then
					return " "
				end
				return ""
			end,
			hl = { bg = colors.base01 },
			right_sep = sep.block,
			left_sep = sep.left .. sep.block,
			truncate_hide = true,
			priority = 20,
		},
		error = {
			provider = "diagnostic_errors",
			hl = { fg = colors.base08, bg = colors.base01 },
			right_sep = sep.block,
			truncate_hide = true,
			priority = 20,
		},
		warning = {
			provider = "diagnostic_warnings",
			hl = { fg = colors.base0A, bg = colors.base01 },
			right_sep = sep.block,
			truncate_hide = true,
			priority = 20,
		},
		info = {
			provider = "diagnostic_info",
			hl = { fg = colors.base0C, bg = colors.base01 },
			right_sep = sep.block,
			truncate_hide = true,
			priority = 20,
		},
		hint = {
			provider = "diagnostic_hints",
			hl = { fg = colors.base0E, bg = colors.base01 },
			right_sep = sep.block,
			truncate_hide = true,
			priority = 20,
		},
		sep = {
			provider = function()
				if lsp.is_lsp_attached() then
					return sep.right .. sep.pri
				end
				return ""
			end,
			hl = { fg = colors.base01 },
			truncate_hide = true,
			priority = 20,
		},
	}

	comps.filetype = {
		provider = {
			name = "file_type",
			opts = {
				case = "lowercase",
			},
		},
		right_sep = sep.pri,
		priority = 80,
	}

	-- Location information
	comps.location = {
		percentage = {
			provider = "line_percentage",
			right_sep = sep.sec,
			priority = 90,
		},
		location = {
			provider = {
				name = "position",
				opts = { padding = true },
			},
			right_sep = sep.sec,
			priority = 90,
		},
	}

	require("feline").setup({
		theme = {
			bg = colors.base00,
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
		components = {
			active = {
				{
					-- Mode
					-- comps.mode,
					-- File info
					comps.file.folder,
					comps.file.filename,
					-- Git
					comps.git.branch,
					comps.git.change,
					comps.git.add,
					comps.git.remove,
					comps.git.sep,
				},
				{},
				{
					-- Diag
					comps.diag.status,
					comps.diag.error,
					comps.diag.warning,
					comps.diag.info,
					comps.diag.hint,
					comps.diag.sep,
					-- Filetype
					comps.filetype,
					-- Location
					comps.location.percentage,
					comps.location.location,
				},
			},
			inactive = {
				{
					-- File info
					comps.file.folder,
					comps.file.filename,
				},
				{},
				{
					comps.location.percentage,
				},
			},
		},
	})
end
