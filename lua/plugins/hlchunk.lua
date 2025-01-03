return {
	-- Other plugins...

	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			chunk = {
				enable = true,
				use_treesitter = true,
				notify = true,
				exclude_filetypes = { "help", "markdown" },
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "┌",
					left_bottom = "└",
					right_arrow = "─",
				},
				style = "#00ffff",
			},
			indent = {
				enable = true,
				chars = { "│", "┆", "┊" },
				use_treesitter = false,
				exclude_filetypes = { "help", "dashboard" },
			},
			line_num = {
				enable = true,
				style = "#FF4500",
			},
			blank = {
				enable = true,
				chars = { " " },
				style = { "#808080" },
			},
		},
	},

	-- More plugins...
}
