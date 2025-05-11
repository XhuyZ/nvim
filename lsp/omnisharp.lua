-- luals.lua
return {
	cmd = { "omnisharp" },
	filetypes = { ".cs" },
	root_markers = { ".csproj", ".sln", ".git" },
	telemetry = { enabled = false },
	formatters = {
		ignoreComments = false,
	},
	settings = {
		omnisharp = {
			enableEditorConfigSupport = true,
			enableMsBuildLoadProjectsOnDemand = false,
			enableRoslynAnalyzers = true,
			organizeImportsOnFormat = true,
			enableImportCompletion = true,
			sdkIncludePrereleases = true, -- use preview .NET SDKs if needed
		},
	},
}
