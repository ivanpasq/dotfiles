return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local parsers = { "go", "gomod", "gosum", "lua", "yaml", "json", "markdown", "dockerfile" }

			for _, parser in ipairs(parsers) do
				pcall(function()
					vim.treesitter.language.add(parser)
				end)
			end

			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "go", "lua", "yaml", "json", "markdown", "dockerfile" },
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})
		end,
	},
}
