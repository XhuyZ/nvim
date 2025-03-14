return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },

		-- example using `opts` for defining servers
		opts = {
			servers = {
				lua_ls = {},
				csharp_ls = {},
				omnisharp = {},
				tsserver = {
					root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json", ".git"),
					on_attach = function(client, bufnr)
						-- Disable formatting (use Prettier or other formatters)
						client.server_capabilities.documentFormattingProvider = false

						-- Key mappings
						local opts = { noremap = true, silent = true }
						vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
						vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
						vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
						vim.api.nvim_buf_set_keymap(
							bufnr,
							"n",
							"<leader>ca",
							"<Cmd>lua vim.lsp.buf.code_action()<CR>",
							opts
						)
					end,
				},
			},
		},
	},
}
