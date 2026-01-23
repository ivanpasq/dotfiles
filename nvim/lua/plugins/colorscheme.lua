return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
      },
      integrations = {
        telescope = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            warnings = { "undercurl" },
          },
        },
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
