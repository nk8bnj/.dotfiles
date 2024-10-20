return {
	{
		"ThePrimeagen/harpoon",
		lazy = true,

		config = function()
			-- set keymaps
			local harpoon_ui = require("harpoon.ui")
			local harpoon_mark = require("harpoon.mark")

			vim.keymap.set("n", "<leader>ho", function()
				harpoon_ui.toggle_quick_menu()
			end, { desc = "Open Harpoon UI" })

			-- Add current file to harpoon
			vim.keymap.set("n", "<leader>ha", function()
				harpoon_mark.add_file()
			end, { desc = "Add file to Harpoon" })

			-- Remove current file from harpoon
			vim.keymap.set("n", "<leader>hr", function()
				harpoon_mark.rm_file()
			end, { desc = "Remove file from Harpoon" })

			-- Remove all files from harpoon
			vim.keymap.set("n", "<leader>hc", function()
				harpoon_mark.clear_all()
			end, { desc = "Clear all files from Harpoon" })

			-- Quickly jump to harpooned files
			vim.keymap.set("n", "<leader>1", function()
				harpoon_ui.nav_file(1)
			end, { desc = "Go to Harpoon file 1" })

			vim.keymap.set("n", "<leader>2", function()
				harpoon_ui.nav_file(2)
			end, { desc = "Go to Harpoon file 2" })

			vim.keymap.set("n", "<leader>3", function()
				harpoon_ui.nav_file(3)
			end, { desc = "Go to Harpoon file 3" })

			vim.keymap.set("n", "<leader>4", function()
				harpoon_ui.nav_file(4)
			end, { desc = "Go to Harpoon file 4" })

			vim.keymap.set("n", "<leader>5", function()
				harpoon_ui.nav_file(5)
			end, { desc = "Go to Harpoon file 5" })
		end,
	},
}
