-- set leader key to space
vim.g.mapleader = " "

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
