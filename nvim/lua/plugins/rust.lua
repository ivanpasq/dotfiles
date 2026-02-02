return {
	"mrcjkb/rustaceanvim",
	version = "^5",
	lazy = false,
	ft = { "rust" },
	config = function()
		vim.g.rustaceanvim = {
			tools = {
				hover_actions = {
					auto_focus = true,
				},
			},
			server = {
				on_attach = function(_, bufnr)
					local keymap = vim.keymap.set

					keymap("n", "<leader>ca", function()
						vim.cmd.RustLsp("codeAction")
					end, { buffer = bufnr, desc = "Rust code action" })
					keymap("n", "<leader>ce", function()
						vim.cmd.RustLsp("explainError")
					end, { buffer = bufnr, desc = "Rust explain error" })
					keymap("n", "<leader>cr", function()
						vim.cmd.RustLsp("runnables")
					end, { buffer = bufnr, desc = "Rust runnables" })
					keymap("n", "<leader>cd", function()
						vim.cmd.RustLsp("debuggables")
					end, { buffer = bufnr, desc = "Rust debuggables" })
					keymap("n", "<leader>ct", function()
						vim.cmd.RustLsp("testables")
					end, { buffer = bufnr, desc = "Rust testables" })
					keymap("n", "K", function()
						vim.cmd.RustLsp({ "hover", "actions" })
					end, { buffer = bufnr, desc = "Rust hover" })
				end,
				default_settings = {
					["rust-analyzer"] = {
						check = {
							command = "clippy",
						},
						cargo = {
							allFeatures = true,
						},
						procMacro = {
							enable = true,
						},
						inlayHints = {
							chainingHints = { enable = true },
							typeHints = { enable = true },
							parameterHints = { enable = true },
						},
					},
				},
			},
			dap = {
				adapter = require("rustaceanvim.config").get_codelldb_adapter(
					vim.fn.stdpath("data") .. "/mason/bin/codelldb",
					vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/lldb/lib/liblldb.dylib"
				),
			},
		}
	end,
}
