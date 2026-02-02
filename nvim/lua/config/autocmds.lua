vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = {
		"*/templates/*.yaml",
		"*/templates/*.tpl",
		"*/templates/**/*.yaml",
		"*/templates/**/*.tpl",
	},
	callback = function()
		vim.bo.filetype = "helm"
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = {
		"Chart.yaml",
		"values.yaml",
		"values*.yaml",
	},
	callback = function()
		vim.bo.filetype = "yaml"
	end,
})
