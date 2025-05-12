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
