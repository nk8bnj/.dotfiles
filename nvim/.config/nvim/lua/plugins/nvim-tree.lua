return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				relativenumber = true,
				adaptive_size = true,
        side = "left",
			},
			-- -- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							-- arrow_closed = "", -- arrow when folder is closed
							-- arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			-- actions = {
			-- 	open_file = {
			-- 		window_picker = {
			-- 			enable = false,
			-- 		},
			-- 	},
			-- },
			-- git = {
			-- 	ignore = false,
			-- },
		})

		-- set keymaps
		vim.keymap.set(
			"n",
			"<leader>e",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "Toggle file explorer on current file" }
		) -- toggle file explorer on current file
	end,
}
