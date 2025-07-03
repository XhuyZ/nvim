return {
	{
		"kndndrj/nvim-dbee",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup()

			-- Set keymap for toggle UI
			vim.keymap.set("n", "<leader>db", function()
				require("dbee").toggle()
			end, { desc = "Dbee: Toggle UI" })
		end,
	},
}
