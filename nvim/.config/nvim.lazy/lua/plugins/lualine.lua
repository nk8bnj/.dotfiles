return {
  "nvim-lualine/lualine.nvim",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "greeid/lualine-so-fancy.nvim",
    },
  },
  event = "VeryLazy",

  config = function()
    require("lualine").setup({
      options = {
        -- theme = "auto",
        theme = {
          normal = {
            a = { fg = "#94A0A1", bg = "#2E353B" },
            b = { fg = "#a7c080", bg = "#2E353B" },
            c = { fg = "#94A0A1", bg = "#2E353B" },
          },
          insert = {
            a = { fg = "#94A0A1", bg = "#2E353B" },
            b = { fg = "#7fbbb3", bg = "#2E353B" },
            c = { fg = "#94A0A1", bg = "#2E353B" },
          },
          visual = {
            a = { fg = "#94A0A1", bg = "#2E353B" },
            b = { fg = "#d699b6", bg = "#2E353B" },
            c = { fg = "#94A0A1", bg = "#2E353B" },
          },
          command = {
            a = { fg = "#94A0A1", bg = "#2E353B" },
            b = { fg = "#dbbc7f", bg = "#2E353B" },
            c = { fg = "#94A0A1", bg = "#2E353B" },
          },
          replace = {
            a = { fg = "#94A0A1", bg = "#2E353B" },
            b = { fg = "#e67e80", bg = "#2E353B" },
            c = { fg = "#94A0A1", bg = "#2E353B" },
          },
          inactive = {
            a = { fg = "#94A0A1", bg = "#2E353B" },
            b = { fg = "#94A0A1", bg = "#2E353B" },
            c = { fg = "#94A0A1", bg = "#2E353B" },
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
        lualine_a = {
          {
            "mode",
            icon_enabled = true,
            fmt = function(str)
              return "-- " .. str .. " --"
            end,
          },
        },
        lualine_b = {
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
        lualine_c = {
          {
            "fancy_diagnostics",
            diagnostics_color = {
              error = { fg = "#EE6160" },
            },
            symbols = { error = " ", warn = " ", info = "󰋼 ", hint = "󰛨 " },
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          { "fancy_branch", icon = "" },
          {
            "fancy_diff",
            symbols = { added = " ", modified = " ", removed = " " },
            colored = true,
          },
        },
      },
    })
  end,
}
