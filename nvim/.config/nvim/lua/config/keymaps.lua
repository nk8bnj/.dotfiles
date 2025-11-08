-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- use jk to exit insert mode
vim.keymap.set("i", "jk", "<esc>", { desc = "Esc" })

-- Save and quit
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>c", "<cmd>bd<cr>", { desc = "Close buffer" })

-- Move to beginning/end of line
vim.keymap.set("n", "H", "^", { desc = "Start of line" })
vim.keymap.set("n", "L", "$", { desc = "End of line" })

-- Quick Up and Down
vim.keymap.set("n", "<s-k>", "5k", { desc = "move up" })
vim.keymap.set("n", "<s-j>", "5j", { desc = "move down" })

-- Comment lines
vim.keymap.set("n", "<leader>/", "<cmd>normal gcc<cr>", { desc = "Comment line" })
vim.keymap.set("v", "<leader>/", "<cmd>normal vgc<cr>", { desc = "Comment line" })

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Go to Definition
-- map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go to [D]efinition" })

-- Split window vertically
vim.keymap.set("n", "<leader>\\", "<cmd>vsplit<cr>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>-", "<cmd>split<cr>", { desc = "Split window horizontally" })

-- Press 'R' for quick find/replace for the word under the cursor
vim.keymap.set("n", "R", function()
	local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
	local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end, { desc = "Replace current word" })

-- clear search highlights
vim.keymap.set(
	"n",
	"<Esc>",
	"<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
	{ desc = "Clear search highlights" }
)

-- Define the keymap for Lazy update and MasonUpdate
vim.keymap.set("n", "<leader>lu", function()
	vim.cmd("Lazy update")
	vim.cmd("MasonUpdate")
end, { desc = "Update Lazy and Mason" })

--Open spectre for global find/replace
vim.keymap.set("n", "<leader>S", function()
	require("spectre").toggle()
end, { desc = "Open Spectre" })

-- Open Spectre for global find/replace for the word under the cursor
vim.keymap.set("n", "<leader>sw", function()
	require("spectre").open_visual({ select_word = true })
end, { desc = "Search current word" })

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize -2<CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Make split windows equal width & height
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)

-- Toggle Twilight
vim.keymap.set("n", "<leader>tl", "<cmd>Twilight<cr>", { desc = "Toggle Twilight" })
