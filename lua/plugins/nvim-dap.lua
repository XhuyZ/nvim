return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		config = function()
			local dap = require("dap")

			-- C# adapter
			dap.adapters.coreclr = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/bin/netcoredbg", --install netcoredbg via packagemanager
				args = { "--interpreter=vscode" },
			}

			-- C# configurations
			dap.configurations.cs = {
				{
					type = "coreclr",
					name = "Launch ASP.NET Core",
					request = "launch",
					program = function()
						return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net8.0/HB.API.dll", "file")
					end,
					cwd = vim.fn.getcwd(),
					stopAtEntry = false,
					serverReadyAction = {
						action = "openExternally",
						pattern = "Now listening on: (http?://\\S+)",
					},
					env = {
						ASPNETCORE_ENVIRONMENT = "Development",
					},
					sourceFileMap = {
						["/Views"] = "${workspaceFolder}/Views",
						["/Areas"] = "${workspaceFolder}/Areas",
					},
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
