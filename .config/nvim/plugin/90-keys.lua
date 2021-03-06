local vim = vim
local k = vim.keymap

------------------------------------------------------------
-- Keybindings
------------------------------------------------------------
-- Save
k.set({ "n", "i" }, "<C-o>w", "<cmd>write<cr>", { silent = true })
-- Exit
k.set({ "n", "i" }, "<C-d>", "<cmd>BufDel<cr>", { silent = true })
-- Undo
k.set({ "n", "i" }, "<C-o>z", "<cmd>undo<cr>")
-- One window
k.set("n", "<leader>wo", "<cmd>only<cr>")

-- Buffer navigation
k.set("n", "<leader>]", "<cmd>bnext<cr>")
k.set("n", "<leader>[", "<cmd>bprev<cr>")
k.set("n", "L", "<cmd>bnext<cr>")
k.set("n", "H", "<cmd>bprev<cr>")
k.set({ "n", "i" }, "<C-o>n", "<cmd>bnext<cr>")
k.set({ "n", "i" }, "<C-o>p", "<cmd>bprev<cr>")

-- Find / CtrlP
k.set("n", "<C-p>", "<cmd>Telescope find_files<cr>")
k.set("n", "<C-o>fa", "<cmd>Telescope<cr>")
k.set("n", "<leader>ft", "<cmd>Telescope tags<cr>")
k.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
k.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
k.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
k.set("n", "<leader>fc", "<cmd>Telescope commands<cr>")
k.set("n", "<leader>fa", "<cmd>Telescope<cr>")

-- Trouble / Diag
k.set({ "n", "i" }, "<C-o>j", "<cmd>TroubleToggle<cr>", { silent = true })
k.set("n", "<leader>oj", "<cmd>TroubleToggle<cr>")
k.set("n", "<leader>j", "<cmd>lua vim.diagnostic.goto_next()<cr>")
k.set("n", "<leader>k", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
k.set({ "n", "i" }, "<C-o>k", "<cmd>SymbolsOutline<cr>", { silent = true })
-- k.set("n", "<space>e", vim.diagnostic.open_float, { noremap = true, silent = true })
k.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
k.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })
-- k.set("n", "<space>q", vim.diagnostic.setloclist, { noremap = true, silent = true })

-- Hop / Easymotion
k.set("n", "<leader><leader>w", "<cmd>HopWord<cr>")
k.set("n", "<leader><leader>j", "<cmd>HopWordAC<cr>")
k.set("n", "<leader><leader>k", "<cmd>HopWordBC<cr>")

-- Incremental search
k.set("n", "<esc>", "<cmd>noh<cr>")
k.set("n", "\\", "<cmd>noh<cr>")

-- Directory Tree
k.set({ "n", "i" }, "<C-o>b", "<cmd>NvimTreeToggle<cr>")
k.set("n", "<leader>ob", "<cmd>NvimTreeToggle<cr>")
