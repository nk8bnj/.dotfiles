return {
	"nk8bnj/neoforest",
	version = false,
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme neoforest")
    -- vim.cmd("hi Normal guibg=#2d353c")
    -- vim.cmd("hi NormalNC guibg=#2d353c")
	end,
}

-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("tokyonight").setup({
-- 			integrations = {
-- 				cmp = true,
-- 				fidget = true,
-- 				gitsigns = true,
-- 				harpoon = true,
-- 				indent_blankline = {
-- 					enabled = false,
-- 					scope_color = "sapphire",
-- 					colored_indent_levels = false,
-- 				},
-- 				mason = true,
-- 				native_lsp = { enabled = true },
-- 				noice = true,
-- 				notify = true,
-- 				symbols_outline = true,
-- 				telescope = true,
-- 				treesitter = true,
-- 				treesitter_context = true,
-- 			},
-- 		})
--
-- 		-- Set the colorscheme
-- 		vim.cmd.colorscheme("tokyonight-storm")
--
-- 		-- Change nvim-tree background color to red
-- 		vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "#24283B" })
-- 		vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "#24283B" })
-- 	end,
-- }
