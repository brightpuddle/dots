local util = require("zenbones.util")
local lush = require("lush")
local hsluv = lush.hsluv

local M = {}

local base = {
  darker2 = hsluv("#242933"),
  darker1 = hsluv("#292e39"),
  lighter = hsluv("#fdfdfd"),
  nord0 = hsluv("#2e3440"),
  nord1 = hsluv("#3b4252"),
  nord2 = hsluv("#434c5e"),
  nord3 = hsluv("#4c566a"),
  nord4 = hsluv("#d8dee9"),
  nord5 = hsluv("#e5e9f0"),
  nord6 = hsluv("#eceff4"),
  nord7 = hsluv("#8fbcbb"),
  nord8 = hsluv("#88c0d0"),
  nord9 = hsluv("#81a1c1"),
  nord10 = hsluv("#5e81ac"),
  nord11 = hsluv("#bf616a"),
  nord12 = hsluv("#d08770"),
  nord13 = hsluv("#ebcb8b"),
  nord14 = hsluv("#a3be8c"),
  nord15 = hsluv("#b48ead"),
}

M.dark = util.palette_extend({
  bg1 = base.darker1,
  bg2 = base.darker2,
  bg = base.nord0,
  fg = base.nord6,
  rose = base.nord11,
  leaf = base.nord14,
  wood = base.nord12,
  water = base.nord7,
  blossom = base.nord15,
  sky = base.nord8,
}, "dark")

M.light = util.palette_extend({
  bg1 = hsluv("#e5d7d0"),
  bg2 = hsluv("#cfc1ba"),
  bg = base.lighter,
}, "light")

M.base = base

return M
