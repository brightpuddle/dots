vim.filetype.add({
  extension = {
    gotmpl = "gotmpl",
    re = "reason",
  },
})
vim.g.lazyvim_picker = "fzf"
vim.g.snacks_animate = false
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.zenlocal_transparent_background = true
vim.g.zenwritten_transparent_background = true
vim.g.zenwritten_lightness = "bright"

vim.o.background = "light"
vim.o.cursorline = false
vim.o.relativenumber = false
vim.o.signcolumn = "number"
vim.o.statuscolumn = ""
vim.o.wildignore = ".DS_Store"
vim.o.wrap = true
vim.o.writebackup = false
vim.o.list = false
