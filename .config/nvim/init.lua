vim.loader.enable()
require("config.options")
require("config.keymaps")
require("config.filetype")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	disabled_plugins = {
		"getscript",
		"getscriptPlugin",
		"vimball",
		"vimballPlugin",
		"2html_plugin",
		"logiPat",
		"rrhelper",
		"netrw",
		"netrwPlugin",
		"netrwSettings",
		"netrwFileHandlers",
	},
})
