return function()
	local k = vim.keymap
	local npairs = require("nvim-autopairs")

	-- these mappings are coq recommended mappings unrelated to nvim-autopairs
	-- k.set("i", "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
	-- k.set("i", "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
	-- k.set("i", "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
	-- k.set("i", "<s-tab>", [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

	_G.MUtils = {}

	MUtils.CR = function()
		if vim.fn.pumvisible() ~= 0 then
			if vim.fn.complete_info({ "selected" }).selected ~= -1 then
				return npairs.esc("<c-y>")
			else
				return npairs.esc("<c-e>") .. npairs.autopairs_cr()
			end
		else
			return npairs.autopairs_cr()
		end
	end
	k.set("i", "<cr>", "v:lua.MUtils.CR()", { expr = true, noremap = true })

	MUtils.BS = function()
		if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
			return npairs.esc("<c-e>") .. npairs.autopairs_bs()
		else
			return npairs.autopairs_bs()
		end
	end
	k.set("i", "<bs>", "v:lua.MUtils.BS()", { expr = true, noremap = false })
end
