-- luals.lua
return {
	cmd = { "omnisharp" },
	filetypes = { ".cs" },
	root_markers = { ".csproj", ".sln", ".git" },
	telemetry = { enabled = false },
	formatters = {
		ignoreComments = false,
	},
	-- settings = {
	-- 	Lua = {
	-- 		runtime = {
	-- 			version = "LuaJIT",
	-- 		},
	-- 		signatureHelp = { enabled = true },
	-- 	},
	-- },
}
