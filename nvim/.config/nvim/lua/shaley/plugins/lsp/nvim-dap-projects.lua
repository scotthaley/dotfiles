return {
	"ldelossa/nvim-dap-projects",
	enabled = false,
	config = function()
		require("nvim-dap-projects").search_project_config()
	end,
}
