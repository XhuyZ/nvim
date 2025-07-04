return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				csharpier = { "csharpier" },
				jq = { "jq" },
				typescript = { "prettierd", "prettier", stop_after_first = true },
			},
		},
	},
}
