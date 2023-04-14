pcall(require, "impatient")

local g = vim.g

------------------------------------------------------------
-- Disable unused builtins
------------------------------------------------------------
-- g.loaded_gzip = 1
-- g.loaded_zip = 1
-- g.loaded_zipPlugin = 1
-- g.loaded_tar = 1
-- g.loaded_tarPlugin = 1

g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_2html_plugin = 1

-- g.loaded_matchit = 1
-- g.loaded_matchparen = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1

g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

------------------------------------------------------------
-- NVIM settings
------------------------------------------------------------
vim.g.mapleader = " "

local o = vim.o
o.autoindent = true
o.cb = "unnamed"
o.copyindent = true
-- o.cursorline = true
o.backup = false
o.expandtab = true
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldenable = false
o.grepprg = "rg --color=never"
o.guicursor = "a:blinkon0,i:ver25-iCursor"
o.ignorecase = true
o.laststatus = 3
o.cmdheight = 0
o.linebreak = true
o.mouse = "a"
o.number = true
o.shiftround = true
o.shiftwidth = 2
o.shortmess = o.shortmess .. "c"
o.shortmess = o.shortmess .. "I"
o.showcmd = false
o.swapfile = false
o.syntax = true
o.signcolumn = "number"
o.smartcase = true
o.softtabstop = 2
o.tabstop = 2
o.termguicolors = true
o.ttimeoutlen = 1
o.wildignore = ".DS_Store"
o.wildmode = "list:longest,full"
o.writebackup = false

vim.cmd([[set t_vb=]])
vim.g.loaded_python_provider = 1
vim.g.python3_host_prog = "/Users/nathan/.local/share/zinit/plugins/pyenv---pyenv/shims/python"
vim.g.python_host_skip_check = 1
vim.g.python3_host_skip_check = 1
o.pyxversion = 3

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = false,
	update_in_insert = false,
	severity_sort = false,
})

-- Plugins that use settings for config
g.better_escape_shortcut = "jk"

-- Nord colorscheme settings
g.nord_contrast = true
g.nord_borders = true
g.nord_enable_sidebar_background = true
g.nord_italic = false

local packerSyncGrp = vim.api.nvim_create_augroup("PackerSyncGrp", {})
vim.api.nvim_clear_autocmds({ group = packerSyncGrp })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	group = packerSyncGrp,
	pattern = { "**/nvim/lua/config/*.lua", "**/nvim/plugin/*main.lua" },
	command = "source <afile> | PackerCompile",
})
