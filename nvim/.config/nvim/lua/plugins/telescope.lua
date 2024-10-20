return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				-- path_display = { "smart" },
				layout_config = {
					width = 0.8,
					preview_width = 0.53,
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
		vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Find old files" })
		vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Find word" })
		vim.keymap.set("n", "<leader> ", "<cmd>Telescope buffers<cr>", { desc = "Find all open buffers" })
		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

		vim.keymap.set("n", "<leader>fF", function()
			require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
		end, { desc = "Find all files" })
		vim.keymap.set("n", "<leader>fW", function()
			require("telescope.builtin").live_grep({
				additional_args = function(args)
					return vim.list_extend(args, { "--hidden", "--no-ignore" })
				end,
			})
		end, { desc = "Find word in all files" })
	end,
}
