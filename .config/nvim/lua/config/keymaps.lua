local k = vim.keymap

-- j/k for wrapped text
k.set({ "n", "v" }, "j", "gj", { silent = true })
k.set({ "n", "v" }, "k", "gk", { silent = true })

-- Save
k.set({ "n", "i" }, "<C-o>w", "<cmd>write<cr>", { silent = true, desc = "Save" })
k.set({ "n", "i" }, "<C-o>z", "<cmd>undo<cr>", { desc = "Undo" })
k.set("n", "<leader>wo", "<cmd>only<cr>")

-- Incremental search5
k.set("n", "<esc>", "<cmd>noh<cr>")
k.set("n", "\\", "<cmd>noh<cr>")

-- Scrolling (remap of half page up/down)
k.set({ "n", "i", "v" }, "<C-n>", "<S-Down><cr>", { silent = true })
k.set({ "n", "i", "v" }, "<C-p>", "<S-Up><cr>", { silent = true })
