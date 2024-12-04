return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		spec = {
			{ "<leader>a", group = "avante" },
			{ "<leader>b", group = "buffer" },
			{ "<leader>c", group = "lsp" },
			{ "<leader>e", group = "neotree" },
			{ "<leader>f", group = "telescope" },
			{ "<leader>g", group = "git" },
			{ "<leader>j", group = "hop" },
			{ "<leader>m", group = "format" },
			{ "<leader>s", group = "session" },
			{ "<leader>t", group = "neotest" },
			{ "<leader>w", group = "window" },
			{ "<leader>x", group = "trouble" },
		},
	},
}
