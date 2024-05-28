return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  config = function()
    require("barbar").setup({
      auto_hide = 1,
      animation = false,
      highlight_visible = false,
      icons = {
        separator_at_end = false,
      },
    })
  end,
}
