return function()
	local vi_mode = require("feline.providers.vi_mode")
	local lsp = require("feline.providers.lsp")
	local git = require("feline.providers.git")
	local function get_color(group, attr)
		local hl = vim.api.nvim_get_hl_by_name(group, true)
		if hl and hl[attr] then
			return string.format("#%06x", hl[attr])
		end
	end
	local c = {
		pri = {
			bg = get_color("StatusLineNC", "background"),
			fg = get_color("StatusLineNC", "foreground"),
		},
		sec = {
			bg = get_color("StatusLine", "background"),
			fg = get_color("StatusLine", "foreground"),
		},
		diag = {
			error = get_color("DiagnosticError", "foreground"),
			warning = get_color("DiagnosticWarn", "foreground"),
			info = get_color("DiagnosticInfo", "foreground"),
			hint = get_color("DiagnosticHint", "foreground"),
		},
		git = {
			add = get_color("DiffAdd", "foreground"),
			change = get_color("DiffChange", "foreground"),
			remove = get_color("DiffDelete", "foreground"),
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
	comps.left = {
		provider = sep.left,
		hl = { bg = "Normal", fg = c.pri.bg },
	}
	comps.right = {
		provider = sep.right,
		hl = { bg = "Normal", fg = c.pri.bg },
	}
	comps.mode = {
		provider = function()
			return string.lower(string.sub(vi_mode.get_vim_mode(), 1, 2))
		end,
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
			icon = { str = " ", hl = { fg = get_color("Comment", "foreground") } },
			left_sep = sep.sec,
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
			left_sep = { str = " / ", hl = { fg = get_color("Comment", "foreground") } },
			priority = 50,
		},
	}

	-- Git
	comps.git = {
		branch = {
			provider = "git_branch",
			left_sep = sep.pri .. sep.left .. sep.block,
			hl = { bg = c.sec.bg },
			truncate_hide = true,
			priority = 10,
		},
		add = {
			provider = "git_diff_added",
			icon = "+",
			hl = { fg = c.git.add, bg = c.sec.bg },
			left_sep = sep.block,
			truncate_hide = true,
			priority = 10,
		},
		change = {
			provider = "git_diff_changed",
			icon = "~",
			hl = { fg = c.git.change, bg = c.sec.bg },
			left_sep = sep.block,
			truncate_hide = true,
			priority = 10,
		},
		remove = {
			provider = "git_diff_removed",
			icon = "-",
			hl = { fg = c.git.remove, bg = c.sec.bg },
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
			hl = { fg = c.sec.bg },
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
			hl = { bg = c.sec.bg },
			right_sep = sep.block,
			left_sep = sep.left .. sep.block,
			truncate_hide = true,
			priority = 20,
		},
		error = {
			provider = "diagnostic_errors",
			hl = { fg = c.diag.error, bg = c.sec.bg },
			right_sep = sep.block,
			truncate_hide = true,
			priority = 20,
		},
		warning = {
			provider = "diagnostic_warnings",
			hl = { fg = c.diag.warning, bg = c.sec.bg },
			right_sep = sep.block,
			truncate_hide = true,
			priority = 20,
		},
		info = {
			provider = "diagnostic_info",
			hl = { fg = c.diag.info, bg = c.sec.bg },
			right_sep = sep.block,
			truncate_hide = true,
			priority = 20,
		},
		hint = {
			provider = "diagnostic_hints",
			hl = { fg = c.diag.hint, bg = c.sec.bg },
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
			hl = { fg = c.sec.bg },
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
		hl = { fg = get_color("Number", "foreground") },
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
			bg = c.pri.bg,
			fg = c.pri.fg,
		},
		components = {
			active = {
				{
					comps.left,
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
					comps.right,
				},
			},
			inactive = {
				{
					-- comps.left,
					-- File info
					-- comps.file.folder,
					-- comps.file.filename,
				},
				{},
				{
					-- comps.location.percentage,
					-- comps.right,
				},
			},
		},
	})
end
