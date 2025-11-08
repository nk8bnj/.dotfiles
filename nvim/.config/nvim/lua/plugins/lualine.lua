return {
	"nvim-lualine/lualine.nvim",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"greeid/lualine-so-fancy.nvim",
		},
	},
	event = "VeryLazy",

	-- init = function()
	-- 	vim.g.lualine_laststatus = vim.o.laststatus
	-- 	if vim.fn.argc(-1) > 0 then
	-- 		-- set an empty statusline till lualine loads
	-- 		vim.o.statusline = " "
	-- 	else
	-- 		-- hide the statusline on the starter page
	-- 		vim.o.laststatus = 0
	-- 	end
	-- end,

	config = function()
		local harpoon = require("harpoon.mark")

		local function harpoon_component()
			local total_marks = harpoon.get_length()

			if total_marks == 0 then
				return "Harpoon 󰛣 0/0"
			end

			local current_mark = "0"

			local mark_idx = harpoon.get_current_index()
			if mark_idx ~= nil then
				current_mark = tostring(mark_idx)
			end

			return string.format("Harpoon: 󰛢 %s/%d", current_mark, total_marks)
		end

		require("lualine").setup({
			options = {
				-- theme = "auto",
				theme = {
					normal = {
						a = { fg = "#2D353B", bg = "#a7c080" },
						b = { fg = "#9da9a0", bg = "#4f585e" },
						c = { fg = "#9da9a0", bg = "#343F44" },
					},
					insert = {
						a = { fg = "#2D353B", bg = "#7fbbb3" },
						b = { fg = "#9da9a0", bg = "#4f585e" },
						c = { fg = "#9da9a0", bg = "#343F44" },
					},
					visual = {
						a = { fg = "#2D353B", bg = "#d699b6" },
						b = { fg = "#9da9a0", bg = "#4f585e" },
						c = { fg = "#9da9a0", bg = "#343F44" },
					},
					command = {
						a = { fg = "#2D353B", bg = "#dbbc7f" },
						b = { fg = "#9da9a0", bg = "#4f585e" },
						c = { fg = "#9da9a0", bg = "#343F44" },
					},
					replace = {
						a = { fg = "#2D353B", bg = "#e67e80" },
						b = { fg = "#9da9a0", bg = "#4f585e" },
						c = { fg = "#9da9a0", bg = "#343F44" },
					},
					inactive = {
						a = { fg = "#9da9a0", bg = "#343F44" },
						b = { fg = "#9da9a0", bg = "#4f585e" },
						c = { fg = "#9da9a0", bg = "#343F44" },
					},
				},
				component_separators = { left = " ", right = "-" },
				section_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				globalstatus = true,
				refresh = {
					statusline = 100,
				},
			},
			sections = {
				-- lualine_a section
				lualine_a = {
					{
						function()
							local file = vim.fn.expand("%:t")
							local extension = vim.fn.expand("%:e")
							local full_path = vim.fn.expand("%:p")

							-- Check if the file exists
							if vim.fn.filereadable(full_path) == 1 then
								local icon = require("nvim-web-devicons").get_icon(file, extension)
								local modified_icon = "[+]"

								if vim.bo.modified then
									return icon .. " " .. file .. " " .. modified_icon
								else
									return icon .. " " .. file
								end
							else
								return " explorer"
							end
						end,
					},
				},
				lualine_b = {
					{ "fancy_branch", icon = "" },
					{
						"fancy_diff",
						symbols = { added = " ", modified = " ", removed = " " },
						colored = true,
					},
				},
				lualine_c = {
					{
						"mode",
						icon_enabled = true,
						fmt = function(str)
							return "-- " .. str .. " --"
						end,
					},

					-- {
					-- 	"filename",
					-- 	path = 1,
					-- },
					-- { "mode", icon_enabled = true },
					-- function()
					--   return mode_map[vim.api.nvim_get_mode().mode] or "__"
					-- end,
				},
				lualine_x = {
					-- { "fancy_lsp_servers", icon = "󰒍" },
					{
						"fancy_diagnostics",
						diagnostics_color = {
							error = { fg = "#EE6160" },
						},
						symbols = { error = " ", warn = " ", info = "󰋼 ", hint = "󰛨 " },
					},
				},
				lualine_y = {
					{ "fancy_macro" },
					{ "fancy_searchcount" },
					{ "fancy_location" },
				},
				lualine_z = {
					harpoon_component,
				},
			},
		})
	end,
}

-- return {
-- 	"nvim-lualine/lualine.nvim",
--
-- 	dependencies = {
-- 		"nvim-tree/nvim-web-devicons",
-- 		{
-- 			"greeid/lualine-so-fancy.nvim",
-- 		},
-- 	},
-- 	event = "VeryLazy",
--
-- 	init = function()
-- 		vim.g.lualine_laststatus = vim.o.laststatus
-- 		if vim.fn.argc(-1) > 0 then
-- 			-- set an empty statusline till lualine loads
-- 			vim.o.statusline = " "
-- 		else
-- 			-- hide the statusline on the starter page
-- 			vim.o.laststatus = 0
-- 		end
-- 	end,
--
-- 	config = function()
-- 		local harpoon = require("harpoon.mark")
--
-- 		local function harpoon_component()
-- 			local total_marks = harpoon.get_length()
--
-- 			if total_marks == 0 then
-- 				return "Harpoon 󰛣 0/0"
-- 			end
--
-- 			local current_mark = "0"
--
-- 			local mark_idx = harpoon.get_current_index()
-- 			if mark_idx ~= nil then
-- 				current_mark = tostring(mark_idx)
-- 			end
--
-- 			return string.format("Harpoon: 󰛢 %s/%d", current_mark, total_marks)
-- 		end
--
-- 		require("lualine").setup({
-- 			options = {
-- 				-- theme = "auto",
-- 				theme = {
-- 					normal = {
-- 						a = { fg = "#a7c080", bg = "#2E353B" },
-- 						b = { fg = "#94A0A1", bg = "#2E353B" },
-- 						c = { fg = "#94A0A1", bg = "#2E353B" },
-- 					},
-- 					insert = {
-- 						a = { fg = "#7fbbb3", bg = "#2E353B" },
-- 						b = { fg = "#94A0A1", bg = "#2E353B" },
-- 						c = { fg = "#94A0A1", bg = "#2E353B" },
-- 					},
-- 					visual = {
-- 						a = { fg = "#d699b6", bg = "#2E353B" },
-- 						b = { fg = "#94A0A1", bg = "#2E353B" },
-- 						c = { fg = "#94A0A1", bg = "#2E353B" },
-- 					},
-- 					replace = {
-- 						a = { fg = "#e67e80", bg = "#2E353B" },
-- 						b = { fg = "#94A0A1", bg = "#2E353B" },
-- 						c = { fg = "#94A0A1", bg = "#2E353B" },
-- 					},
-- 					inactive = {
-- 						a = { fg = "#94A0A1", bg = "#2E353B" },
-- 						b = { fg = "#94A0A1", bg = "#2E353B" },
-- 						c = { fg = "#94A0A1", bg = "#2E353B" },
-- 					},
-- 				},
-- 				component_separators = { left = " ", right = "-" },
-- 				section_separators = { left = "", right = "" },
-- 				-- section_separators = { left = "", right = "" },
-- 				-- section_separators = { left = "", right = "" },
-- 				globalstatus = true,
-- 				refresh = {
-- 					statusline = 100,
-- 				},
-- 			},
-- 			sections = {
-- 				-- lualine_a section
-- 				lualine_a = {
-- 					{
-- 						function()
-- 							local file = vim.fn.expand("%:t")
-- 							local extension = vim.fn.expand("%:e")
-- 							local full_path = vim.fn.expand("%:p")
--
-- 							-- Check if the file exists
-- 							if vim.fn.filereadable(full_path) == 1 then
-- 								local icon = require("nvim-web-devicons").get_icon(file, extension)
-- 								local modified_icon = "[+]"
--
-- 								if vim.bo.modified then
-- 									return icon .. " " .. file .. " " .. modified_icon
-- 								else
-- 									return icon .. " " .. file
-- 								end
-- 							else
-- 								return " explorer"
-- 							end
-- 						end,
-- 					},
-- 				},
-- 				lualine_b = {
-- 					{ "fancy_branch", icon = "" },
-- 					{
-- 						"fancy_diff",
-- 						symbols = { added = " ", modified = " ", removed = " " },
-- 						colored = true,
-- 					},
-- 				},
--
-- 				lualine_c = {
-- 					-- {
-- 					-- 	"filename",
-- 					-- 	path = 1,
-- 					-- },
-- 					-- { "mode", icon_enabled = true },
-- 					-- function()
-- 					--   return mode_map[vim.api.nvim_get_mode().mode] or "__"
-- 					-- end,
-- 				},
-- 				lualine_x = {
-- 					{
-- 						"fancy_diagnostics",
-- 						diagnostics_color = {
-- 							error = { fg = "#EE6160" },
-- 						},
-- 						symbols = { error = " ", warn = " ", info = "󰋼 ", hint = "󰛨 " },
-- 					},
-- 					-- { "fancy_lsp_servers", icon = "󰒍" },
-- 				},
-- 				lualine_y = {
-- 					{ "fancy_macro" },
-- 					{ "fancy_searchcount" },
-- 					{ "fancy_location" },
-- 				},
-- 				lualine_z = {
-- 					harpoon_component,
-- 				},
-- 			},
-- 		})
-- 	end,
-- }
