return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed, not both.
		"nvim-telescope/telescope.nvim", -- optional
	},
	keys = {
		{ "<leader>gs", "<cmd>Neogit<CR>", desc = "Neogit status" },
	},
	config = function()
		local neogit = require("neogit")

		neogit.setup({})
	end,
}
