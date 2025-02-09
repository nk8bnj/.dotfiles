return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = false },
				ensure_installed = {
					"json",
					"javascript",
					"typescript",
					"tsx",
					"yaml",
					"html",
					"css",
					"scss",
					"bash",
					"lua",
					"vim",
				},
				sync_install = false, -- Parsers are installed asynchronously
				ignore_install = {}, -- List of parsers to ignore during installation
				modules = {}, -- Reserved for Treesitter's modular architecture
			})
		end,
	},
}

-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	event = { "BufReadPre", "BufNewFile" },
-- 	build = ":TSUpdate",
-- 	dependencies = {
-- 		"windwp/nvim-ts-autotag",
-- 	},
-- 	config = function()
-- 		-- import nvim-treesitter plugin
-- 		local treesitter = require("nvim-treesitter.configs")
--
-- 		-- configure treesitter
-- 		treesitter.setup({ -- enable syntax highlighting
-- 			highlight = {
-- 				enable = true,
-- 			},
-- 			-- enable indentation
-- 			indent = { enable = true },
-- 			-- enable autotagging (w/ nvim-ts-autotag plugin)
-- 			autotag = {
-- 				enable = true,
-- 			},
-- 			-- ensure these language parsers are installed
-- 			ensure_installed = {
-- 				"json",
-- 				"javascript",
-- 				"typescript",
-- 				"tsx",
-- 				"yaml",
-- 				"html",
-- 				"css",
-- 				"scss",
-- 				"prisma",
-- 				"markdown",
-- 				"markdown_inline",
-- 				"svelte",
-- 				"graphql",
-- 				"bash",
-- 				"lua",
-- 				"vim",
-- 				"dockerfile",
-- 				"gitignore",
-- 				"query",
-- 				"vimdoc",
-- 			},
-- 			incremental_selection = {
-- 				enable = true,
-- 				keymaps = {
-- 					init_selection = "<C-space>",
-- 					node_incremental = "<C-space>",
-- 					scope_incremental = false,
-- 					node_decremental = "<bs>",
-- 				},
-- 			},
-- 		})
-- 	end,
-- }
