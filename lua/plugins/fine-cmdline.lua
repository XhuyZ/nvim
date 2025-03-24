return {
	"VonHeikemen/fine-cmdline.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	keys = {
		{
			":",
			function()
				require("fine-cmdline").open()
			end,
			mode = "n",
			desc = "Open fine-cmdline",
		},
	},
	opts = {
		cmdline = {
			prompt = "➜ ",
			exec = function(input)
				vim.api.nvim_feedkeys(":" .. input, "n", true)
			end,
		},
		popup = {
			position = {
				row = "50%",
				col = "50%",
			},
			size = {
				width = "40%",
			},
			border = {
				style = "rounded",
			},
		},
	},
}
