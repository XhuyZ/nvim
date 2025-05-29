return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "Kurren123/mssql.nvim" },
		optional = true,
		event = "VeryLazy",
		opts = function(_, opts)
			-- Thêm component của mssql vào lualine_c
			table.insert(opts.sections.lualine_c, require("mssql").lualine_component)

			-- Thêm component của copilot vào lualine_x tại vị trí thứ 2
			table.insert(
				opts.sections.lualine_x,
				2,
				LazyVim.lualine.status(LazyVim.config.icons.kinds.Copilot, function()
					local clients = package.loaded["copilot"]
							and LazyVim.lsp.get_clients({ name = "copilot", bufnr = 0 })
						or {}
					if #clients > 0 then
						local status = require("copilot.api").status.data.status
						return (status == "InProgress" and "pending") or (status == "Warning" and "error") or "ok"
					end
				end)
			)

			return opts
		end,
	},
}
