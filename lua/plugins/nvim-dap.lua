return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		config = function()
			local dap = require("dap")

			-- C#
			dap.adapters.coreclr = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/home/xhuyz/.local/share/nvim/mason/bin/",
				args = { "-m", "netcoredbg.adapter" },
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
