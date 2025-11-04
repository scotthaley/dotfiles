return {
	"fatih/vim-go",
	ft = "go", -- Lazy load on Go filetypes
	build = ":GoUpdateBinaries",
	config = function()
		-- Disable vim-go LSP features (use gopls via lspconfig instead)
		vim.g.go_def_mapping_enabled = 0 -- Disable gd mapping
		vim.g.go_code_completion_enabled = 0 -- Use nvim-cmp instead

		-- Syntax highlighting
		vim.g.go_highlight_types = 1
		vim.g.go_highlight_fields = 1
		vim.g.go_highlight_functions = 1
		vim.g.go_highlight_function_calls = 1
		vim.g.go_highlight_operators = 1
		vim.g.go_highlight_extra_types = 1
		vim.g.go_highlight_build_constraints = 1
		vim.g.go_highlight_generate_tags = 1

		-- Formatting (if using goimports/gofmt instead of conform.nvim)
		vim.g.go_fmt_autosave = 1
		vim.g.go_fmt_command = "goimports" -- Use goimports instead of gofmt

		-- Metalinter
		vim.g.go_metalinter_autosave = 0 -- Disable auto-save linting (use nvim-lint instead)

		-- Test settings
		vim.g.go_test_show_name = 1

		-- Keybindings (using <leader>G for Go commands, since <leader>g is used for git)
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- Build, run, test
		keymap("n", "<leader>Gr", "<cmd>GoRun<cr>", { desc = "Go Run", noremap = true, silent = true })
		keymap("n", "<leader>Gb", "<cmd>GoBuild<cr>", { desc = "Go Build", noremap = true, silent = true })
		keymap("n", "<leader>Gt", "<cmd>GoTest<cr>", { desc = "Go Test", noremap = true, silent = true })
		keymap("n", "<leader>GT", "<cmd>GoTestFunc<cr>", { desc = "Go Test Function", noremap = true, silent = true })
		keymap("n", "<leader>Gc", "<cmd>GoCoverageToggle<cr>", { desc = "Go Coverage Toggle", noremap = true, silent = true })

		-- Code navigation and info
		keymap("n", "<leader>Gi", "<cmd>GoInfo<cr>", { desc = "Go Info", noremap = true, silent = true })
		keymap("n", "<leader>GI", "<cmd>GoImplements<cr>", { desc = "Go Implements", noremap = true, silent = true })
		keymap("n", "<leader>Gd", "<cmd>GoDescribe<cr>", { desc = "Go Describe", noremap = true, silent = true })

		-- Tags and imports
		keymap("n", "<leader>Ga", "<cmd>GoAddTags<cr>", { desc = "Go Add Tags", noremap = true, silent = true })
		keymap("n", "<leader>GA", "<cmd>GoRemoveTags<cr>", { desc = "Go Remove Tags", noremap = true, silent = true })
		keymap("n", "<leader>Gf", "<cmd>GoFillStruct<cr>", { desc = "Go Fill Struct", noremap = true, silent = true })

		-- Alternate between test and implementation
		keymap("n", "<leader>Gx", "<cmd>GoAlternate<cr>", { desc = "Go Alternate Test/Impl", noremap = true, silent = true })
	end,
}
