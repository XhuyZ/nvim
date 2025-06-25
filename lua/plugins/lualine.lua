return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "Kurren123/mssql.nvim" },
		optional = true,
		event = "VeryLazy",
		opts = function(_, opts)
			table.insert(opts.sections.lualine_c, require("mssql").lualine_component)
			return opts
		end,
	},
}
