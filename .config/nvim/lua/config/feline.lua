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
    left = "█",
    right = "█",
    block = "█",
  }

  local function has_diags()
    return lsp.diagnostics_exist(1)
        or lsp.diagnostics_exist(2)
        or lsp.diagnostics_exist(3)
        or lsp.diagnostics_exist(4)
  end

  local function has_git_changes()
    local gsd = vim.b.gitsigns_status_dict
    for _, type in pairs({ "added", "removed", "changed" }) do
      if gsd and gsd[type] and gsd[type] > 0 then
        return true
      end
    end
    return false
  end

  local comps = {}
  -- VIM mode
  comps.mode = {
    provider = "  ",
    hl = function()
      return {
        bg = vi_mode.get_mode_color(),
        fg = colors.base00,
      }
    end,
    right_sep = sep.right,
    left_sep = sep.left,
    priority = 90,
  }

  -- File info
  comps.file = {
    folder = {
      provider = function()
        return vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
      end,
      icon = { str = "  ", hl = { fg = colors.base03 } },
      hl = { bg = c.sec.bg },
      left_sep = " " .. sep.left,
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
      hl = { style = "italic", bg = colors.base01 },
      right_sep = sep.block .. sep.right,
      left_sep = sep.block,
      priority = 50,
    },
  }

  -- Git
  comps.git = {
    branch = {
      provider = "git_branch",
      hl = { bg = c.sec.bg },
      left_sep = " " .. sep.left .. sep.block,
      right_sep = function()
        if has_git_changes() then
          return sep.block
        end
        return sep.block .. sep.right
      end,
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
        if has_git_changes() then
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
      hl = { bg = c.sec.bg },
      left_sep = sep.left .. sep.block,
      right_sep = function()
        if has_diags() then
          return sep.block
        end
        return sep.block .. sep.right
      end,
      truncate_hide = true,
      priority = 20,
    },
    error = {
      provider = "diagnostic_errors",
      hl = { fg = colors.base08, bg = colors.base01 },
      left_sep = sep.block,
      truncate_hide = true,
      priority = 20,
    },
    warning = {
      provider = "diagnostic_warnings",
      hl = { fg = colors.base0A, bg = colors.base01 },
      left_sep = sep.block,
      truncate_hide = true,
      priority = 20,
    },
    info = {
      provider = "diagnostic_info",
      hl = { fg = colors.base0C, bg = colors.base01 },
      left_sep = sep.block,
      truncate_hide = true,
      priority = 20,
    },
    hint = {
      provider = "diagnostic_hints",
      hl = { fg = colors.base0E, bg = colors.base01 },
      left_sep = sep.block,
      truncate_hide = true,
      priority = 20,
    },
    sep = {
      provider = function()
        if has_diags() then
          return sep.block .. sep.right .. " "
        end
        return " "
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
    hl = { bg = c.sec.bg },
    right_sep = sep.block .. sep.right .. " ",
    left_sep = sep.left .. sep.block,
    priority = 80,
  }

  -- Location information
  comps.location = {
    percentage = {
      provider = "line_percentage",
      hl = { bg = c.sec.bg },
      right_sep = sep.block .. sep.right .. " ",
      left_sep = sep.left .. sep.block,
      priority = 90,
    },
    location = {
      provider = {
        name = "position",
        opts = { padding = true },
      },
      hl = function()
        return {
          bg = vi_mode.get_mode_color(),
          fg = colors.base00,
        }
      end,
      left_sep = sep.left .. sep.block,
      right_sep = sep.block .. sep.right,
      priority = 90,
    },
  }

  require("feline").setup({
    components = {
      active = {
        {
          -- Mode
          comps.mode,
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
  })
end
