return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{
			-- WGSL (WebGPU Shading Language) tree-sitter support
			"szebniok/tree-sitter-wgsl",
			build = function()
				vim.cmd("TSInstall wgsl")
			end,
		},
	},
	opts = function(_, opts)
		-- Register WGSL file type
		vim.filetype.add({
			extension = {
				wgsl = "wgsl",
			},
		})

		-- Configure WGSL parser
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.wgsl = {
			install_info = {
				url = "https://github.com/szebniok/tree-sitter-wgsl",
				files = { "src/parser.c", "src/scanner.c" },
				branch = "main",
			},
			filetype = "wgsl",
		}

		-- Add wgsl to ensure_installed if not already present
		if type(opts.ensure_installed) == "table" then
			vim.list_extend(opts.ensure_installed, { "wgsl" })
		end
	end,
}
