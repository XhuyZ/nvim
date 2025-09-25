return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		config = function()
			local dap = require("dap")

			dap.adapters.coreclr = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/bin/netcoredbg",
				args = { "--interpreter=vscode" },
			}
			dap.adapters.firefox = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/bin/firefox-debug-adapter",
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

			-- Firefox configurations (JavaScript / TypeScript)
			dap.configurations.typescriptreact = {
				{
					name = "Launch Firefox against localhost",
					type = "firefox",
					request = "launch",
					reAttach = true,
					url = "http://localhost:3000", -- adjust to your dev server
					webRoot = "${workspaceFolder}",
					firefoxExecutable = "/usr/bin/firefox-developer-edition", -- adjust for your system
				},
			}
			dap.configurations.typescript = {
				{
					name = "Launch Firefox against localhost",
					type = "firefox",
					request = "launch",
					reAttach = true,
					url = "http://localhost:3000", -- adjust to your dev server
					webRoot = "${workspaceFolder}",
					firefoxExecutable = "/usr/bin/firefox-developer-edition", -- adjust for your system
				},
			}
			-- Keybindings
			vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP Continue" })
			vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
			vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
			vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
			vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
			vim.keymap.set("n", "<leader>db", dap.set_breakpoint, { desc = "Set Breakpoint" })
			vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open DAP REPL" })
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
