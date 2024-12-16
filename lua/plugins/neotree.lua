return{
	{
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
   -- vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>') 
   keys = {
		{
			"<leader>E",
			"<cmd>Neotree toggle<cr>",
			desc = "File Explorer",
		},
		{
			"<leader>e",
			function()
				require("neo-tree.command").execute({
					toggle = true,
					reveal_force_cwd = true,
				})
			end,
			desc = "File Explorer",
		},
	},
   
},
}
