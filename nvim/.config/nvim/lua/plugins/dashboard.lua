return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  lazy = false,
  config = function()
    require("dashboard").setup({
      theme = "hyper",

      hide = {
        statusline = false,
      },
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          {
            desc = "󰚰 Update",
            group = "@property",
            action = function()
              vim.cmd("Lazy update")
              vim.cmd("MasonUpdate")
            end,
            key = "u",
          },
          {
            icon = "󰱼 ",
            icon_hl = "@variable",
            desc = "Files",
            group = "Label",
            action = "Telescope find_files",
            key = "f",
          },
          {
            desc = "󰥖 Oldfiles",
            group = "DiagnosticHint",
            action = "Telescope oldfiles",
            key = "o",
          },
          {
            desc = "󰒍 Mason",
            group = "Number",
            action = "Mason",
            key = "m",
          },
        },
        footer = {
          "",
          "Neovim - " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
        },
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
