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

    wk.add({
      { "<leader>f", group = "Find" },
      { "<leader>t", group = "Terminal" },
      { "<leader>s", group = "Session/Search" },
      { "<leader>c", group = "Code" },
      { "<leader>x", group = "Diagnostics/Quickfix" },
      { "<leader>g", group = "Git" },
      { "<leader>gh", group = "Git Hunks" },
      { "<leader>gt", group = "Git Toggle" },
      { "<leader>l", group = "Lint" },

      { "<leader>b", group = "Buffer" },
      { "<leader>bm", group = "Buffer Move" },
      { "<leader>n", group = "Noice" },
      { "<leader>u", group = "UI/Notifications" },

      { "<leader>gd", group = "Git Diffview" },
      { "<leader>a", group = "Aerial (Code Outline)" },

      { "<leader>xl", group = "Location List" },
    })
  end,
}
