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
		b00 = "#2b303b",
		b01 = "#343d46",
		b02 = "#4f5b66",
		b03 = "#65737e",
		b04 = "#a7adba",
		b05 = "#c0c5ce",
		b06 = "#dfe1e8",
		b07 = "#eff1f5",
		b08 = "#bf616a",
		b09 = "#d08770",
		b0A = "#ebcb8b",
		b0B = "#a3be8c",
		b0C = "#96b5b4",
		b0D = "#8fa1b3",
		b0E = "#b48ead",
		b0F = "#ab7967",
		pri = {
			bg = get_color("Normal", "background"),
			fg = get_color("StatusLineNC", "foreground"),
		},
		sec = {
			bg = get_color("StatusLineNC", "background"),
			fg = get_color("StatusLineNC", "foreground"),
		},
		tri = {
			bg = get_color("Normal", "background"),
			fg = get_color("SpecialChar", "foreground"),
		},
		diag = {
			error = "#bf616a",
			warning = "#ebcb8b",
			info = "#96b5b4",
			hint = "#b48ead",
		},
		git = {
			add = "#a3be8c",
			change = "#96b5b4",
			remove = "#bf616a",
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
			icon = { str = "  ", hl = { fg = get_color("Comment", "foreground") } },
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
		hl = { fg = c.tri.fg },
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
		vi_mode_colors = {
			-- Normal
			NORMAL = c.b0B,
			OP = c.b0B,
			-- Insert
			INSERT = c.b0C,
			-- Visual modes
			VISUAL = c.b0E,
			LINES = c.b0E,
			BLOCK = c.b0E,
			-- Replace
			REPLACE = c.b08,
			["V-REPLACE"] = c.b08,
			ENTER = c.b0D,
			MORE = c.b0D,
			SELECT = c.b09,
			COMMAND = c.b09,
			SHELL = c.b0B,
			TERM = c.b0C,
			NONE = c.b0A,
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
