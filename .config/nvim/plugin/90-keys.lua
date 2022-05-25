local vim = vim
local k = vim.keymap
local g = vim.g

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
k.set({ "n", "i" }, "<C-o>n", "<cmd>bnext<cr>")
k.set({ "n", "i" }, "<C-o>p", "<cmd>bprev<cr>")
k.set("n", "H", "<Plug>(CybuPrev)")
k.set("n", "L", "<Plug>(CybuNext)")

-- Integrated split nav
g.tmux_navigator_no_mappings = 1
k.set("n", "<leader>wh", "<cmd>TmuxNavigateLeft<cr>")
k.set("n", "<leader>wj", "<cmd>TmuxNavigateDown<cr>")
k.set("n", "<leader>wk", "<cmd>TmuxNavigateUp<cr>")
k.set("n", "<leader>wl", "<cmd>TmuxNavigateRight<cr>")
k.set({ "n", "i" }, "<C-w>h", "<cmd>TmuxNavigateLeft<cr>")
k.set({ "n", "i" }, "<C-w>j", "<cmd>TmuxNavigateDown<cr>")
k.set({ "n", "i" }, "<C-w>k", "<cmd>TmuxNavigateUp<cr>")
k.set({ "n", "i" }, "<C-w>l", "<cmd>TmuxNavigateRight<cr>")

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

-- Hop / Easymotion
k.set("n", "<leader><leader>w", "<cmd>HopWord<cr>")
k.set("n", "<leader><leader>j", "<cmd>HopWordAC<cr>")
k.set("n", "<leader><leader>k", "<cmd>HopWordBC<cr>")

-- Incremental search
k.set("n", "<esc>", "<cmd>noh<cr>")

-- Directory Tree
k.set({ "n", "i" }, "<C-o>b", "<cmd>NvimTreeToggle<cr>")
k.set("n", "<leader>ob", "<cmd>NvimTreeToggle<cr>")
