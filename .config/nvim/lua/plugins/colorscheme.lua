return {
  "mcchrish/zenbones.nvim",
  lazy = false,
  priority = 1000,
  dependencies = {
    "rktjmp/lush.nvim",
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "zenwritten",
      },
    },
    { "cormacrelf/dark-notify" },
  },
  config = function()
    require("dark_notify").run({
      schemes = {
        dark = "zenlocal",
        light = "zenwritten",
      },
    })
  end,
}
