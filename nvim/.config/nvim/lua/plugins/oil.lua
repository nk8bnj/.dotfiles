vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function()
    vim.opt_local.colorcolumn = ""
  end,
})

return {
--   {
--     "stevearc/oil.nvim",
--     opts = {},
--     -- Optional dependencies
--     dependencies = { "nvim-tree/nvim-web-devicons" },
--     config = function()
--       require("oil").setup({
--         -- use_default_keymaps = false,
--         default_file_explorer = true,
--         delete_to_trash = true,
--         skip_confirm_for_simple_edits = true,
--         keymaps = {
--           ["g?"] = "actions.show_help",
--           ["<CR>"] = "actions.select",
--           ["<C-\\>"] = "actions.select_split",
--           ["<C-enter>"] = "actions.select_vsplit", -- this is used to navigate left
--           ["<C-t>"] = "actions.select_tab",
--           ["<C-p>"] = "actions.preview",
--           ["<C-c>"] = "actions.close",
--           ["<C-r>"] = "actions.refresh",
--           ["-"] = "actions.parent",
--           ["_"] = "actions.open_cwd",
--           ["`"] = "actions.cd",
--           ["~"] = "actions.tcd",
--           ["gs"] = "actions.change_sort",
--           ["gx"] = "actions.open_external",
--           ["g."] = "actions.toggle_hidden",
--         },
--         view_options = {
--           show_hidden = true,
--         },
--       })
--
--       -- set keymaps
--       vim.keymap.set("n", "<leader>e", function()
--   require("oil").toggle_float()
-- end, { desc = "Open Explorer" })
--
--     end,
--   },
}
