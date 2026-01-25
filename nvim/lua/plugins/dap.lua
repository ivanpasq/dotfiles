return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"leoluz/nvim-dap-go",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("dap-go").setup()

			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			vim.fn.sign_define(
				"DapBreakpointCondition",
				{ text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
			)
			vim.fn.sign_define(
				"DapBreakpointRejected",
				{ text = "○", texthl = "DapBreakpointRejected", linehl = "", numhl = "" }
			)
			vim.fn.sign_define(
				"DapStopped",
				{ text = "→", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" }
			)
			vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

			vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e51400" })
			vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#f9a825" })
			vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379" })
			vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#2e4d3a" })

			dapui.setup({
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.25 },
							{ id = "breakpoints", size = 0.25 },
							{ id = "stacks", size = 0.25 },
							{ id = "watches", size = 0.25 },
						},
						size = 40,
						position = "left",
					},
					{
						elements = {
							{ id = "repl", size = 0.5 },
							{ id = "console", size = 0.5 },
						},
						size = 10,
						position = "bottom",
					},
				},
			})

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			local keymap = vim.keymap.set
			keymap("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
			keymap("n", "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Conditional breakpoint" })
			keymap("n", "<leader>dc", dap.continue, { desc = "Continue/Start" })
			keymap("n", "<leader>di", dap.step_into, { desc = "Step into" })
			keymap("n", "<leader>do", dap.step_over, { desc = "Step over" })
			keymap("n", "<leader>dO", dap.step_out, { desc = "Step out" })
			keymap("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
			keymap("n", "<leader>dl", dap.run_last, { desc = "Run last" })
			keymap("n", "<leader>dt", function()
				require("dap-go").debug_test()
			end, { desc = "Debug test" })
			keymap("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
		end,
	},
}
