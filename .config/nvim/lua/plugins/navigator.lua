-- TMUX and split navigation
return {
  "numToStr/Navigator.nvim",
  config = function()
    require("Navigator").setup()
  end,
  lazy = false,
  keys = {
    { "<C-w>h", "<cmd>NavigatorLeft<cr>", mode = { "n", "i" }, desc = "Navigate Left" },
    { "<C-w>j", "<cmd>NavigatorDown<cr>", mode = { "n", "i" }, desc = "Navigate Down" },
    { "<C-w>k", "<cmd>NavigatorUp<cr>", mode = { "n", "i" }, desc = "Navigate Up" },
    { "<C-w>l", "<cmd>NavigatorRight<cr>", mode = { "n", "i" }, desc = "Navigate Right" },
    { "<leader>wh", "<cmd>NavigatorLeft<cr>", desc = "Navigate Left" },
    { "<leader>wj", "<cmd>NavigatorDown<cr>", desc = "Navigate Down" },
    { "<leader>wk", "<cmd>NavigatorUp<cr>", desc = "Navigate Up" },
    { "<leader>wl", "<cmd>NavigatorRight<cr>", desc = "Navigate Right" },
  },
}
