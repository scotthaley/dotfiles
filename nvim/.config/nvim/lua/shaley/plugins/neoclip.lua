return {
	"AckslD/nvim-neoclip.lua",
	dependencies = {
		-- you'll need at least one of these
		{ "nvim-telescope/telescope.nvim" },
		-- {'ibhagwan/fzf-lua'},
	},
	keys = {
		{ "<leader>fy", "<cmd>Telescope neoclip<CR>", desc = "Fuzzy find registers" },
	},
	config = function()
		require("neoclip").setup({
			default_register = "*",
			on_select = {
				move_to_front = true,
				close_telescope = true,
			},
			keys = {
				telescope = {
					i = {
						select = "<cr>",
						paste = "<c-p",
						paste_behind = "<c-m>",
						replay = "<c-q>", -- replay a macro
						delete = "<c-d>", -- delete an entry
						edit = "<c-e>", -- edit an entry
						custom = {},
					},
					n = {
						select = "<cr>",
						paste = "p",
						--- It is possible to map to more than one key.
						-- paste = { 'p', '<c-p>' },
						paste_behind = "P",
						replay = "q",
						delete = "d",
						edit = "e",
						custom = {},
					},
				},
			},
		})
	end,
}
