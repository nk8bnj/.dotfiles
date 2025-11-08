return {
	"code-biscuits/nvim-biscuits",
	requires = {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},

	config = function()
		require("nvim-biscuits").setup({
			toggle_keybind = "<leader>sb",
			show_on_start = false,
			default_config = {
				max_length = 50,
				min_distance = 5,
				-- prefix_string = " 📎 ",
			},
			language_config = {
				html = {
					-- prefix_string = " 🌐 ",
				},
				javascript = {
					-- prefix_string = " ✨ ",
					max_length = 80,
				},
				python = {
					disabled = true,
				},
			},
		})
	end,
}
