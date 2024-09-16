return {
	"mrjones2014/legendary.nvim",
	version = "v2.13.9",
	-- since legendary.nvim handles all your keymaps/commands,
	-- its recommended to load legendary.nvim before other plugins
	priority = 10000,
	lazy = false,
	-- sqlite is only needed if you want to use frecency sorting
	dependencies = { "kkharji/sqlite.lua" },
	keys = {
		{ "<leader><leader>", "<cmd>Legendary<CR>", desc = "Open legendary" },
	},
	config = function()
		local legendary = require("legendary")

		legendary.setup({
			keymaps = {
				{ "fd", { i = "<ESC>" }, desc = "Exit insert mode" },
				{ "<leader>nh", "<cmd>nohl<CR>", desc = "Clear search highlights" },
				{ "<leader>qq", "<cmd>qa<CR>", desc = "Quit all" },
				{ "<leader>w=", "<C-w>=", desc = "Make splits equal size" },
				{ "<leader>wx", "<cmd>close<CR>", desc = "Close current split" },
			},
			extensions = {
				-- automatically load keymaps from lazy.nvim's `keys` option
				lazy_nvim = true,
				-- load keymaps and commands from nvim-tree.lua
				-- nvim_tree = true,
				-- load commands from smart-splits.nvim
				-- and create keymaps, see :h legendary-extensions-smart-splits.nvim
				-- smart_splits = {
				-- 	directions = { "h", "j", "k", "l" },
				-- 	mods = {
				-- 		move = "<C>",
				-- 		resize = "<M>",
				-- 	},
				-- },
				-- load commands from op.nvim
				-- op_nvim = true,
				-- load keymaps from diffview.nvim
				-- diffview = true,
			},
		})
	end,
}
