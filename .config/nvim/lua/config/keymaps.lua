local k = vim.keymap

-- j/k for wrapped text
k.set({ "n", "v" }, "j", "gj", { silent = true })
k.set({ "n", "v" }, "k", "gk", { silent = true })

-- Save
k.set({ "n", "i" }, "<C-o>w", "<cmd>write<cr>", { silent = true, desc = "Save" })
k.set({ "n", "i" }, "<C-o>z", "<cmd>undo<cr>", { desc = "Undo" })
k.set("n", "<leader>wo", "<cmd>only<cr>")

-- Incremental search
k.set("n", "<esc>", "<cmd>noh<cr>")
k.set("n", "\\", "<cmd>noh<cr>")

-- Scrolling (remap of half page up/down)
k.set({ "n", "i", "v" }, "<C-n>", "<S-Down><cr>", { silent = true })
k.set({ "n", "i", "v" }, "<C-p>", "<S-Up><cr>", { silent = true })

k.set({ "n", "i", "v" }, "<C-o>e", "<cmd>Neotree toggle<cr>", { silent = true, desc = "Toggle file tree" })
k.set(
  { "n", "i", "v" },
  "<C-o>r",
  "<cmd>Trouble symbols toggle win.position=right focus=true<cr>",
  { silent = true, desc = "Symbols" }
)

-- Buffer nav
-- k.set({ "n" }, "L", "<cmd>bnext<cr>", { silent = true, desc = "Next buffer" })
-- k.set({ "n" }, "H", "<cmd>bprevious<cr>", { silent = true, desc = "Previous buffer" })

-- Terminal
k.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
