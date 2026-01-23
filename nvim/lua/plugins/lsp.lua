return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "gopls",
          "yamlls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underlines = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = true,
        },
      })

      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " "}
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local opts = { buffer = event.buf }
          local keymap = vim.keymap.set

          keymap("n", "gd", vim.lsp.buf.definition, opts)
          keymap("n", "gr", vim.lsp.buf.references, opts)
          keymap("n", "gi", vim.lsp.buf.implementation, opts)
          keymap("n", "K", vim.lsp.buf.hover, opts)
          keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
          keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          keymap("n", "<leader>d", vim.diagnostic.open_float, opts)
          keymap("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)
          keymap("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts)
        end,
      })

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      vim.lsp.config("gopls", {
        capabilities = capabilities,
      })

      vim.lsp.config("yamlls", {
        capabilities = capabilities,
        settings = {
          yaml = {
            schemas = {
              kubernetes = "/*.yaml",
            },
          },
        },
      })

      vim.lsp.enable({ "lua_ls", "gopls", "yamlls" })
    end,
  },
}
