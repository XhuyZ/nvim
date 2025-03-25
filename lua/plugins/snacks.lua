return {
	{
		"folke/snacks.nvim",
		opts = {
			image = {
				formats = {
					"png",
					"jpg",
					"jpeg",
					"gif",
					"bmp",
					"webp",
					"tiff",
					"heic",
					"avif",
					"mp4",
					"mov",
					"avi",
					"mkv",
					"webm",
					"pdf",
				},
			},
			dashboard = {
				preset = {
					header = [[
██╗  ██╗██╗  ██╗██╗   ██╗██╗   ██╗███████╗
╚██╗██╔╝██║  ██║██║   ██║╚██╗ ██╔╝╚══███╔╝
 ╚███╔╝ ███████║██║   ██║ ╚████╔╝   ███╔╝
 ██╔██╗ ██╔══██║██║   ██║  ╚██╔╝   ███╔╝
██╔╝ ██╗██║  ██║╚██████╔╝   ██║   ███████╗
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚══════╝]],
				},

				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{
						pane = 1,
						icon = " ",
						desc = "Browse Repo",
						padding = 1,
						key = "b",
						action = function()
							Snacks.gitbrowse()
						end,
					},
					function()
						local in_git = Snacks.git.get_root() ~= nil
						local cmds = {
							{
								title = "Notifications",
								-- cmd = "gh notify -s -a -n5",
								action = function()
									vim.ui.open("https://github.com/notifications")
								end,
								key = "n",
								icon = " ",
								height = 1,
								enabled = true,
							},
							{
								title = "Open Issues",
								-- cmd = "gh issue list -L 2",
								key = "i",
								action = function()
									vim.fn.jobstart("gh issue list --web", { detach = true })
								end,
								icon = " ",
								height = 1,
							},
							{
								icon = " ",
								title = "Open PRs",
								-- cmd = "gh pr list -L 1",
								key = "p",
								action = function()
									vim.fn.jobstart("gh pr list --web", { detach = true })
								end,
								height = 1,
							},
							{
								icon = " ",
								title = "Git Status",
								cmd = "git --no-pager diff --stat -B -M -C",
								height = 3,
							},
						}
						return vim.tbl_map(function(cmd)
							return vim.tbl_extend("force", {
								pane = 1,
								section = "terminal",
								enabled = in_git,
								padding = 1,
								ttl = 5 * 60,
								indent = 3,
							}, cmd)
						end, cmds)
					end,
					{ section = "startup" },
				},
			},
		},
	},
}
