return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		config = function()
			local dap = require("dap")

			-- C# adapter
			dap.adapters.coreclr = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/bin/netcoredbg",
				args = { "--interpreter=vscode" },
			}

			-- C# configurations
			dap.configurations.cs = {
				{
					type = "coreclr",
					name = "launch - netcoredbg",
					request = "launch",
					program = function()
						return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net9.0/learn_dbg", "file")
					end,
				},
			}

			-- Keybindings
			vim.keymap.set("n", "<F5>", function()
				dap.continue()
			end, { desc = "DAP Continue" })
			vim.keymap.set("n", "<F9>", function()
				dap.toggle_breakpoint()
			end, { desc = "Toggle Breakpoint" })
			vim.keymap.set("n", "<F10>", function()
				dap.step_over()
			end, { desc = "Step Over" })
			vim.keymap.set("n", "<F11>", function()
				dap.step_into()
			end, { desc = "Step Into" })
			vim.keymap.set("n", "<F12>", function()
				dap.step_out()
			end, { desc = "Step Out" })
			vim.keymap.set("n", "<leader>db", function()
				dap.set_breakpoint()
			end, { desc = "Set Breakpoint" })
			vim.keymap.set("n", "<leader>dr", function()
				dap.repl.open()
			end, { desc = "Open DAP REPL" })
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dapui = require("dapui")
			local dap = require("dap")

			dapui.setup()

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
}
