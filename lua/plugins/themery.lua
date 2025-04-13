return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			-- add the config here
			themes = { "dracula", "catppuccin", "onedark", "cyberdream", "bluloco", "solarized-osaka" }, -- Your list of installed colorschemes.
			livePreview = true, -- Apply theme while picking. Default to true.
		})
		vim.keymap.set("n", "<leader>uC", "<cmd>Themery<cr>")
	end,
}
