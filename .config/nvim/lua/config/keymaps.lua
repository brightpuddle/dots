local k = vim.keymap

-- Copilot: move th5ese keybindings into ./lua/plugins/whichkey.lua
-- Move them into the whichkey configuration

-- Search
k.set("n", "<C-p>", "<cmd>Telescope smart_open<cr>")
k.set("n", "<C-o>fa", "<cmd>Telescope<cr>")
k.set("n", "<C-o>fb", "<cmd>Telescope buffers<cr>")

-- j/k for wrapped text
k.set({ "n", "v" }, "j", "gj", { silent = true })
k.set({ "n", "v" }, "k", "gk", { silent = true })

-- Save
k.set({ "n", "i" }, "<C-o>w", "<cmd>write<cr>", { silent = true })
-- Exit
k.set({ "n", "i" }, "<C-d>", "<cmd>BufDel<cr>", { silent = true })
-- Undo
k.set({ "n", "i" }, "<C-o>z", "<cmd>undo<cr>")

-- Navigation
k.set({ "n", "i" }, "<C-w>h", "<cmd>NavigatorLeft<cr>")
k.set({ "n", "i" }, "<C-w>j", "<cmd>NavigatorDown<cr>")
k.set({ "n", "i" }, "<C-w>k", "<cmd>NavigatorUp<cr>")
k.set({ "n", "i" }, "<C-w>l", "<cmd>NavigatorRight<cr>")
k.set({ "n", "i" }, "<C-h>", "<cmd>NavigatorLeft<cr>")
k.set({ "n", "i" }, "<C-j>", "<cmd>NavigatorDown<cr>")
k.set({ "n", "i" }, "<C-k>", "<cmd>NavigatorUp<cr>")
k.set({ "n", "i" }, "<C-l>", "<cmd>NavigatorRight<cr>")
k.set("n", "<leader>wo", "<cmd>only<cr>")

-- Copilot
k.set({ "n", "i" }, "<C-o>c", "<cmd>Copilot panel<cr>")

-- Buffer navigation
k.set("n", "<leader>]", "<cmd>bnext<cr>")
k.set("n", "<leader>[", "<cmd>bprev<cr>")
k.set("n", "L", "<cmd>bnext<cr>")
k.set("n", "H", "<cmd>bprev<cr>")
k.set({ "n", "i" }, "<C-o>n", "<cmd>bnext<cr>")
k.set({ "n", "i" }, "<C-o>p", "<cmd>bprev<cr>")

-- Incremental search5
k.set("n", "<esc>", "<cmd>noh<cr>")
k.set("n", "\\", "<cmd>noh<cr>")

k.set({ "n", "i" }, "<C-o>b", "<cmd>Neotree toggle<cr>")
k.set("n", "<leader>ob", "<cmd>Neotree toggle buffers<cr>")

-- Diagnostics
k.set({ "n", "i" }, "<C-o>j", "<cmd>TroubleToggle<cr>", { silent = true })
k.set("n", "<leader>oj", "<cmd>TroubleToggle<cr>")
k.set("n", "<leader>j", "<cmd>lua vim.diagnostic.goto_next()<cr>")
k.set("n", "<leader>k", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
k.set({ "n", "i" }, "<C-o>k", "<cmd>SymbolsOutline<cr>", { silent = true })
k.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
k.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })
k.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })

-- Scrolling (remap of half page up/down)
k.set({ "n", "i", "v" }, "<C-j>", "<S-Down><cr>", { silent = true })
k.set({ "n", "i", "v" }, "<C-k>", "<S-Up><cr>", { silent = true })
