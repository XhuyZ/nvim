---@type vim.lsp.Config
return {
	cmd = { "groovy-language-server" },
	filetypes = { "groovy", "gradle" },
	root_markers = { ".git", "gradlew", "build.gradle", "settings.gradle" },
	single_file_support = true,
}
