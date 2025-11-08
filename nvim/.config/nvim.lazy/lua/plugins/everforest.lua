return {
  -- "sainnhe/everforest",
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
--   "craftzdog/solarized-osaka.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     require("solarized-osaka").setup({
--       style = "dark", -- "dark" or "light"
--       transparent = true,
--     })
--     --[[
--     require('mini.animate').setup({
--       open = { enable = false },
--       close = { enable = false },
--     })
--     ]]
--     --
--     vim.cmd([[colorscheme solarized-osaka]])
--   end,
-- }
