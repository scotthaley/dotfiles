return {
	"mrjones2014/smart-splits.nvim",
	keys = {
		{ "<leader>wr", "<cmd>SmartResizeMode<CR>", desc = "Split resize mode" },
		{ "<leader>wH", "<cmd>SmartSwapLeft<CR>", desc = "Swap with left split" },
		{ "<leader>wL", "<cmd>SmartSwapRight<CR>", desc = "Swap with right split" },
		{ "<leader>wJ", "<cmd>SmartSwapDown<CR>", desc = "Swap with below split" },
		{ "<leader>wK", "<cmd>SmartSwapUp<CR>", desc = "Swap with above split" },
	},
	config = function()
		local smartsplits = require("smart-splits")
		vim.notify = require("notify")

		smartsplits.setup({
			resize_mode = {
				silent = true,
				hooks = {
					on_enter = function()
						vim.notify("Entering split resize mode")
					end,
					on_leave = function()
						vim.notify("Exiting split resize mode")
					end,
				},
			},
			cursor_follows_swapped_bufs = true,
		})
	end,
}
