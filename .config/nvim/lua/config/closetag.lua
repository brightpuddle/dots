return function()
	vim.g.closetag_xhtml_filenames = "*.html,*.j2,*.xhtml,*.js,*.jsx,*.re,*.xml,*.svelte,*.ts,*.tsx,*.md,*.hbs"
	vim.g.closetag_xhtml_filetypes = "xhtml,javascriptreact,typescriptreact,html.handlebars"
	vim.g.closetag_regions = {
		javascriptreact = "jsxRegion,tsxRegion",
		typescriptreact = "jsxRegion,tsxRegion",
	}
end
