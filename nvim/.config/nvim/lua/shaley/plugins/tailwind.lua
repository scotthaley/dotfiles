-- tailwind-tools.lua
-- Temporarily disabled: plugin uses deprecated require('lspconfig') API
-- See: https://github.com/luckasRanaworlds/tailwind-tools.nvim/issues
-- Re-enable once upstream fixes nvim 0.11+ compatibility
return {
	"luckasRanarison/tailwind-tools.nvim",
	name = "tailwind-tools",
	enabled = false,
	build = ":UpdateRemotePlugins",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim", -- optional
		"neovim/nvim-lspconfig", -- optional
	},
	opts = {}, -- your configuration
}
