return {
	{
		"mfussenegger/nvim-dap",
		event = "User BaseFile",
		config = function()
			local dap = require("dap")

			-- C#
			dap.adapters.coreclr = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/bin/netcoredbg",
				args = { "--interpreter=vscode" },
			}
			dap.configurations.cs = {
				{
					type = "coreclr",
					name = "launch - netcoredbg",
					request = "launch",
					program = function() -- Ask the user what executable wants to debug
						return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/Program.dll", "file")
					end,
				},
			}
		end,
	},
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
}
