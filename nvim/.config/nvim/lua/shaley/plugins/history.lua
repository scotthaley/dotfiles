return {
	"wilfreddenton/history.nvim",
	requires = { { "nvim-lua/plenary.nvim" } },
	config = function()
		local history = require("history")

		history.setup({
			keybinds = {
				back = "<leader>bp",
				forward = "<leader>bn",
				view = "<leader>bb",
			},
		})
	end,
}
