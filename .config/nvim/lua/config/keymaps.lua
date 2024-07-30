local k = vim.keymap

-- Copilot: move th5ese keybindings into ./lua/plugins/whichkey.lua
-- Move them into the whichkey configuration

-- Search
k.set("n", "<C-p>", function()
	require("telescope").extensions.smart_open.smart_open({ cwd_only = true })
end)
k.set("n", "<C-o>fa", "<cmd>Telescope<cr>", { desc = "Find all files" })
k.set("n", "<C-o>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
k.set("n", "<leader>fa", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
k.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
k.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find in files" })
k.set("n", "<leader>ft", "<cmd>Telescope tags<cr>", { desc = "Find tags" })
k.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Find symbols" })

-- j/k for wrapped text
k.set({ "n", "v" }, "j", "gj", { silent = true })
k.set({ "n", "v" }, "k", "gk", { silent = true })

-- Save
k.set({ "n", "i" }, "<C-o>w", "<cmd>write<cr>", { silent = true, desc = "Save" })
-- Exit
k.set({ "n", "i" }, "<C-d>", "<cmd>BufDel<cr>", { silent = true, desc = "Quit" })
-- Undo
k.set({ "n", "i" }, "<C-o>z", "<cmd>undo<cr>", { desc = "Undo" })
-- Format
k.set({ "n", "i" }, "<C-o>t", "<cmd>Format<cr>", { desc = "Format" })

-- Navigation
k.set({ "n", "i" }, "<C-w>h", "<cmd>NavigatorLeft<cr>")
k.set({ "n", "i" }, "<C-w>j", "<cmd>NavigatorDown<cr>")
k.set({ "n", "i" }, "<C-w>k", "<cmd>NavigatorUp<cr>")
k.set({ "n", "i" }, "<C-w>l", "<cmd>NavigatorRight<cr>")
k.set({ "n", "i" }, "<C-h>", "<cmd>NavigatorLeft<cr>")
k.set({ "n", "i" }, "<C-j>", "<cmd>NavigatorDown<cr>")
k.set({ "n", "i" }, "<C-k>", "<cmd>NavigatorUp<cr>")
k.set({ "n", "i" }, "<C-l>", "<cmd>NavigatorRight<cr>")

k.set("n", "<leader>h", "<cmd>NavigatorLeft<cr>", { desc = "Window left" })
k.set("n", "<leader>j", "<cmd>NavigatorDown<cr>", { desc = "Window down" })
k.set("n", "<leader>k", "<cmd>NavigatorUp<cr>", { desc = "Window up" })
k.set("n", "<leader>l", "<cmd>NavigatorRight<cr>", { desc = "Window right" })
k.set("n", "<leader>wo", "<cmd>only<cr>")

-- Copilot
k.set({ "n", "i" }, "<C-o>c", "<cmd>Copilot panel<cr>", { desc = "Copilot" })

-- Buffer navigation
k.set("n", "<leader>]", "<cmd>BufferNext<cr>")
k.set("n", "<leader>[", "<cmd>BufferPrevious<cr>")
k.set({ "n", "i", "v" }, "<C-o>]", "<cmd>BufferNext<cr>")
k.set({ "n", "i", "v" }, "<C-o>[", "<cmd>BufferPrevious<cr>")
k.set("n", "L", "<cmd>BufferNext<cr>")
k.set("n", "H", "<cmd>BufferPrevious<cr>")
k.set({ "n", "i" }, "<C-o>n", "<cmd>BufferNext<cr>")
k.set({ "n", "i" }, "<C-o>p", "<cmd>BufferPrevious<cr>")

-- Incremental search5
k.set("n", "<esc>", "<cmd>noh<cr>")
k.set("n", "\\", "<cmd>noh<cr>")

k.set({ "n", "i" }, "<C-o>b", "<cmd>Neotree toggle<cr>")
k.set("n", "<leader>ob", "<cmd>Neotree toggle buffers<cr>")

-- Diagnostics
k.set({ "n", "i" }, "<C-o>j", "<cmd>Trouble diagnostics toggle<cr>", { silent = true, desc = "Trouble Diagnostics" })
k.set("n", "<leader>oj", "<cmd>TroubleToggle<cr>", { desc = "Trouble Diagnostics" })
k.set("n", "<leader>j", "<cmd>lua vim.diagnostic.goto_next()<cr>")
k.set("n", "<leader>k", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
k.set({ "n", "i" }, "<C-o>k", "<cmd>SymbolsOutline<cr>", { silent = true })
k.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
k.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })
k.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })

-- Scrolling (remap of half page up/down)
k.set({ "n", "i", "v" }, "<C-j>", "<S-Down><cr>", { silent = true })
k.set({ "n", "i", "v" }, "<C-k>", "<S-Up><cr>", { silent = true })
