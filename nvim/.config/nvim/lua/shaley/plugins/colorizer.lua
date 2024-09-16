return {
	"norcalli/nvim-colorizer.lua",
	opts = { "*" },
	config = function()
		local colorizer = require("colorizer")

		colorizer.setup({
			"css",
			typescript = {
				rgb_fn = true,
			},
		})
	end,
}
