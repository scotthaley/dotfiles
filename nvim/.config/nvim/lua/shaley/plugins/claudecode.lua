return {
	"coder/claudecode.nvim",
	event = "VeryLazy",
	opts = {
		terminal = {
			provider = "none", -- No terminal management; run Claude Code externally
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
