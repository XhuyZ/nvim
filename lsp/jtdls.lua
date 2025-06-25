vim.lsp.config["jdtls"] = {
	cmd = { "jdtls", "--stdio" },
	filetypes = { "pom.xml", "build.gradle", ".git" },
	single_file_support = true,
}
