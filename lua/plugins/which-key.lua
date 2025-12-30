return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    wk.setup({})

    -- Register groups
    wk.add({
      -- Existing groups
      { "<leader>f", group = "Find" },
      { "<leader>t", group = "Terminal" },
      { "<leader>s", group = "Session/Search" }, -- Updated to include Search
      { "<leader>c", group = "Code" },
      { "<leader>x", group = "Trouble/Diagnostics" },
      { "<leader>g", group = "Git" },
      { "<leader>gh", group = "Git Hunks" },
      { "<leader>gt", group = "Git Toggle" },
      { "<leader>l", group = "Lint" },

      -- NEW groups for new plugins
      { "<leader>b", group = "Buffer" },
      { "<leader>bm", group = "Buffer Move" },
      { "<leader>n", group = "Noice" },
      { "<leader>u", group = "UI/Notifications" },
    })
  end,
}
