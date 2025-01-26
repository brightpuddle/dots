return {
  "mcchrish/zenbones.nvim",
  lazy = false,
  priority = 1000,
  dependencies = {
    "rktjmp/lush.nvim",
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "zenlocal",
      },
    },
    "cormacrelf/dark-notify",
  },
  config = function()
    vim.g.zenlocal_transparent_background = true
    vim.o.background = "dark"
    -- require("dark_notify").run()
  end,
}
