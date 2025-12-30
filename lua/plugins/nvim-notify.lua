return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    local notify = require("notify")
    
    notify.setup({
      -- Animation style
      stages = "fade_in_slide_out", -- or "fade", "slide", "static"
      
      -- Timeout for notifications
      timeout = 3000,
      
      -- Background color
      background_colour = "#000000",
      
      -- Icons
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
      },
      
      -- Max width/height
      max_width = 50,
      max_height = 10,
      
      -- Render style
      render = "default", -- or "minimal", "simple", "compact"
      
      -- Minimum level to show
      level = vim.log.levels.INFO,
      
      -- Position
      top_down = true,
    })
    
    -- Set as default notify function
    vim.notify = notify
    
    -- Keymaps for notification history
    vim.keymap.set("n", "<leader>un", function()
      require("notify").dismiss({ silent = true, pending = true })
    end, { desc = "Dismiss notifications" })
    
    vim.keymap.set("n", "<leader>uh", function()
      require("telescope").extensions.notify.notify()
    end, { desc = "Notification history" })
  end,
}
