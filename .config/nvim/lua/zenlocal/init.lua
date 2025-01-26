local lush = require("lush")
local generator = require("zenbones.specs")
local p = require("zenlocal.palette")

local bg = vim.o.background

if bg ~= "light" then
  bg = "dark"
end

local palette = p[bg]

local base = generator.generate(p[bg], bg, generator.get_global_config("zenlocal", bg))

return lush.extends({ base }).with(function()
  ---@diagnostic disable: undefined-global
  return {

    -- General Nord
    String({ fg = palette.leaf }),
    Number({ fg = palette.blossom, gui = "italic" }),
    -- Identifier({ fg = palette.wood, gui = "none" }),
    Statement({ gui = "bold" }),
    Search({ bg = base.StatusLine.bg, gui = "bold,italic" }),

    -- Fix float popup, i.e. 'K'
    ColorColumn({ base.StatusLine }),
    FloatBorder({ base.StatusLine, fg = palette.bg.li(46) }),

    -- Neotree
    NeoTreeNormal({ bg = palette.bg.da(10) }),
    NeoTreeNormalNC({ NeoTreeNormal }),

    -- Trouble
    TroubleNormalNC({ bg = palette.bg.da(10) }),
    TroubleNormal({ TroubleNormalNC }),

    -- Notifications
    NotifyBackground({ bg = palette.bg.da(10) }),

    -- Snacks
    SnacksDim({ base.Comment }),
  }
  ---@diagnostic enable: undefined-global
end)
