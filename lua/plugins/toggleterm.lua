return {
	-- {
	-- 	"akinsho/toggleterm.nvim",
	-- 	version = "*", -- or specify a version like "v2.0.0"
	-- 	opts = {
	-- 		direction = "float",
	-- 		open_mapping = [[<c-\>]],
	-- 		shell = "nu.exe",
	-- 	},
	-- 	config = true,
	-- },
	{
		"akinsho/toggleterm.nvim",
		version = "*", -- or specify a version like "v2.0.0"
		opts = {
			direction = "float",
			open_mapping = [[<c-t>]],
			shell = "nu",
		},
		config = true,
	},
}
