vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
vim.api.nvim_set_keymap("n", ":", "<cmd>lua require('fine-cmdline').open()<CR>", { noremap = true, silent = true })
