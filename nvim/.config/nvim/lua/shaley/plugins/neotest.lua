return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-neotest/neotest-jest",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{ "<leader>tt", "<cmd>lua require('neotest').run.run()<CR>", desc = "Neotest Run Nearest" },
		{
			"<leader>tw",
			"<cmd>lua require('neotest').watch.toggle()<CR>",
			desc = "Neotest Watch Nearest",
		},
		{ "<leader>tT", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", desc = "Neotest Run All" },
		{
			"<leader>tW",
			"<cmd>lua require('neotest').watch.toggle(vim.fn.expand('%'))<CR>",
			desc = "Neotest Watch All",
		},
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-jest")({
					jestCommand = "npm test --",
					env = { CI = true },
					cwd = function(path)
						return vim.fn.getcwd()
					end,
				}),
			},
		})
	end,
}
