return {
	"smoka7/hop.nvim",
	version = "*",
	opts = {
		keys = "etovxqpdygfblzhckisuran",
	},
	keys = {
		{ "<leader>jj", "<cmd>HopChar1<CR>", desc = "Hop to character" },
	},
	config = function()
		local hop = require("hop")

		hop.setup({
			multi_windows = true,
		})
	end,
}
