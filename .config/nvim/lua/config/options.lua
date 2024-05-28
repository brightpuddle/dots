local g = vim.g
g.mapleader = " "

g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.loaded_python_provider = 1
g.python3_host_prog = "/Users/nathan/.local/share/zinit/plugins/pyenv---pyenv/shims/python"
g.python_host_skip_check = 1
g.python3_host_skip_check = 1

local o = vim.o
o.autoindent = true
o.backup = false
o.cb = "unnamed"
o.cmdheight = 0
o.copyindent = true
o.expandtab = true
o.foldenable = false
o.grepprg = "rg --color=never"
o.guicursor = "a:blinkon0,i:ver25-iCursor"
o.ignorecase = true
o.laststatus = 3
o.linebreak = true
o.mouse = "a"
o.number = true
o.pyxversion = 3
o.shiftround = true
o.shiftwidth = 2
o.shortmess = o.shortmess .. "I"
o.shortmess = o.shortmess .. "c"
o.showcmd = false
o.signcolumn = "number"
o.smartcase = true
o.softtabstop = 2
o.swapfile = false
-- o.syntax = true
o.tabstop = 2
o.termguicolors = true
o.ttimeoutlen = 1
o.wildignore = ".DS_Store"
o.wildmode = "list:longest,full"
o.writebackup = false

vim.cmd([[set t_vb=]])
