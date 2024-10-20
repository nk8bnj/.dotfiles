return {
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      local notify = require("notify")

      local filtered_message = { "No information available" }

      -- Override notify function to filter out messages
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.notify = function(message, level, opts)
        local merged_opts = vim.tbl_extend("force", {
          on_open = function(win)
            local buf = vim.api.nvim_win_get_buf(win)
            vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
            vim.api.nvim_win_set_config(win, { zindex = 100 })
          end,
        }, opts or {})

        for _, msg in ipairs(filtered_message) do
          if message == msg then
            return
          end
        end
        return notify(message, level, merged_opts)
      end

      -- Update colors to use catpuccino colors
      vim.cmd([[
        highlight NotifyERRORBorder guifg=#EE6060
        highlight NotifyERRORIcon guifg=#EE6060
        highlight NotifyERRORTitle  guifg=#EE6060
        highlight NotifyINFOBorder guifg=#69CA81
        highlight NotifyINFOIcon guifg=#69CA81
        highlight NotifyINFOTitle guifg=#69CA81
        highlight NotifyWARNBorder guifg=#EFBD58
        highlight NotifyWARNIcon guifg=#EFBD58
        highlight NotifyWARNTitle guifg=#EFBD58
      ]])
    end,
  },
}
