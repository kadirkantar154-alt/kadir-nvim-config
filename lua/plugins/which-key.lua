return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")

    wk.setup({

      wk.add({

        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>t", group = "Terminal" },
        { "<leader>s", group = "Session" },
        { "<leader>c", group = "Code" },
        { "<leader>x", group = "Trouble/Diagnostics" },
      }),
    })
  end,
}
