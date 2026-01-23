return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function ()
    local wk = require("which-key")

    wk.setup({
      preset = "modern",
      delay = 300,
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
    })

    wk.add({
      { "<leader>f", group = "Find (Telescope)" },
      { "<leader>g", group = "Git" },
      { "<leader>t", group = "Terminal" },
      { "<leader>c", group = "Code" },
      { "<leader>d", group = "Diagnostics" },
    })
  end,
}
