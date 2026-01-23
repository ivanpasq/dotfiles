return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function ()
    require("toggleterm").setup({
      size = function (term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<C-\>]],
    direction = "float",
    float_opts = {
      border = "rounded",
    },
    shade_terminals = false,
    })

    local keymap = vim.keymap.set
    keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Terminal float" })
    keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Terminal horizontal" })
    keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Terminal vertical" })

    keymap("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    keymap("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Move to left split" })
    keymap("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Move to lower split" })
    keymap("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Move to upper split" })
    keymap("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Move to right split" })
  end,
}
