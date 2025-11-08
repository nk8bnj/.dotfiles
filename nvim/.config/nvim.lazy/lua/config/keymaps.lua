-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- use jk to exit insert mode
vim.keymap.set("i", "jk", "<esc>", { desc = "Esc" })

-- For conciseness
local opts = { noremap = true, silent = true }

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize -2<CR>", opts)

-- Make split windows equal width & height
vim.keymap.set("n", "<leader>se", "<C-w>=", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Comment lines
vim.keymap.set("n", "<leader>/", "<cmd>normal gcc<cr>", { desc = "Comment line" })
vim.keymap.set("v", "<leader>/", "<cmd>normal vgc<cr>", { desc = "Comment line" })

vim.keymap.set("n", "<leader> ", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })
