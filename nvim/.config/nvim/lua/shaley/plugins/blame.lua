return {
	"FabijanZulj/blame.nvim",
	keys = {
		{ "<leader>gb", "<cmd>BlameToggle<CR>", desc = "Toggle git blame" }, -- toggle file explorer
	},
	config = function()
		require("blame").setup()
	end,
}
