return {
	"nvim-focus/focus.nvim",
	version = "*",
	keys = {
		{ "<leader>wh", "<cmd>FocusSplitLeft<CR>", desc = "Focus left split" },
		{ "<leader>wl", "<cmd>FocusSplitRight<CR>", desc = "Focus right split" },
		{ "<leader>wj", "<cmd>FocusSplitDown<CR>", desc = "Focus below split" },
		{ "<leader>wk", "<cmd>FocusSplitUp<CR>", desc = "Focus above split" },
		{ "<leader>ww", "<cmd>FocusSplitNicely<CR>", desc = "Split nicely" },
	},
	config = function()
		local focus = require("focus")

		focus.setup({
			autoresize = {
				enable = false,
			},
			ui = {
				hybridnumber = true,
				withhighlight = true,
			},
		})

		local ignore_filetypes = { "NvimTree_*" }
		local ignore_buftypes = { "nofile", "prompt", "popup" }

		local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

		vim.api.nvim_create_autocmd("WinEnter", {
			group = augroup,
			callback = function(_)
				if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
					vim.w.focus_disable = true
				else
					vim.w.focus_disable = false
				end
			end,
			desc = "Disable focus autoresize for BufType",
		})

		vim.api.nvim_create_autocmd("FileType", {
			group = augroup,
			callback = function(_)
				if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
					vim.b.focus_disable = true
				else
					vim.b.focus_disable = false
				end
			end,
			desc = "Disable focus autoresize for FileType",
		})
	end,
}
