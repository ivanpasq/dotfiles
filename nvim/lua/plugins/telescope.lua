return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				path_display = { "truncate" },
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = { prompt_position = "top" },
				},
				preview = {
					treesitter = false,
				},
			},
		})

		telescope.load_extension("fzf")

		local builtin = require("telescope.builtin")
		local keymap = vim.keymap.set

		keymap("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		keymap("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
		keymap("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
		keymap("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
		keymap("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
		keymap("n", "<leader>fc", builtin.git_commits, { desc = "Git commits" })
		keymap("n", "<leader>fs", builtin.git_status, { desc = "Git status" })
	end,
}
