return {
	"mfussenegger/nvim-dap",
	keys = {
		{ "<leader>kb", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },
		{ "<leader>kc", "<cmd>lua require'dap'.continue()<CR>", desc = "Continue Debug" },
		{ "<leader>ko", "<cmd>lua require'dap'.step_over()<CR>", desc = "Step Over" },
		{ "<leader>ki", "<cmd>lua require'dap'.step_into()<CR>", desc = "Step Into" },
	},
}
