return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 10,
			-- open_mapping = [[<leader>t]],
			shading_factor = 1,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})

		vim.keymap.set({ "n", "t" }, "<C-t>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
	end,
}
