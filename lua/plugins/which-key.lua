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
      -- Existing groups
      { "<leader>f", group = "Find" },
      { "<leader>t", group = "Terminal" },
      { "<leader>s", group = "Session/Search" },
      { "<leader>c", group = "Code" },
      { "<leader>x", group = "Diagnostics/Quickfix" },
      { "<leader>g", group = "Git" },
      { "<leader>gh", group = "Git Hunks" },
      { "<leader>gt", group = "Git Toggle" },
      { "<leader>gd", group = "Git Diffview" },
      { "<leader>l", group = "Lint" },
      { "<leader>b", group = "Buffer" },
      { "<leader>bm", group = "Buffer Move" },
      { "<leader>n", group = "Noice" },
      { "<leader>u", group = "UI/Notifications" },
      { "<leader>a", group = "Aerial (Code Outline)" },
      { "<leader>xl", group = "Location List" },

      -- NEW: Refactoring group
      { "<leader>r", group = "Refactoring" },
      { "<leader>re", desc = "Extract Function", mode = "x" },
      { "<leader>rf", desc = "Extract Function To File", mode = "x" },
      { "<leader>rv", desc = "Extract Variable", mode = "x" },
      { "<leader>ri", desc = "Inline Variable" },
      { "<leader>rb", desc = "Extract Block" },
      { "<leader>rF", desc = "Extract Block To File" },
      { "<leader>rr", desc = "Refactoring Menu", mode = "x" },

      -- Substitute/Exchange operations (gs prefix)
      { "gs", group = "Substitute" },
      { "gss", desc = "Substitute line" },
      { "gS", desc = "Substitute to EOL" },
      { "gs", desc = "Substitute", mode = "x" },

      -- Exchange operations (gx prefix)
      { "gx", group = "Exchange" },
      { "gxx", desc = "Exchange line" },
      { "gx", desc = "Exchange", mode = "x" },
      { "gxc", desc = "Cancel exchange" },

      -- Folding operations (z prefix - these are vim default but good to document)
      { "z", group = "Fold" },
      { "zR", desc = "Open all folds (UFO)" },
      { "zM", desc = "Close all folds (UFO)" },
      { "zr", desc = "Open folds except kinds (UFO)" },
      { "zm", desc = "Close folds with (UFO)" },
      { "zp", desc = "Peek fold (UFO)" },

      -- Mini.nvim move operations (Alt+hjkl)
      { "<M-h>", desc = "Move left (Mini)", mode = { "n", "v" } },
      { "<M-j>", desc = "Move down (Mini)", mode = { "n", "v" } },
      { "<M-k>", desc = "Move up (Mini)", mode = { "n", "v" } },
      { "<M-l>", desc = "Move right (Mini)", mode = { "n", "v" } },

      -- Mini.splitjoin
      { "gS", desc = "Split/Join toggle (Mini)" },

      -- Various text objects (document the custom ones we set)
      { "gG", desc = "Entire buffer", mode = { "o", "x" } },
      { "ii", desc = "Inner indentation", mode = { "o", "x" } },
      { "ai", desc = "Around indentation", mode = { "o", "x" } },
      { "iL", desc = "Inner URL", mode = { "o", "x" } },
      { "in", desc = "Inner number", mode = { "o", "x" } },
      { "an", desc = "Around number", mode = { "o", "x" } },
      { "iv", desc = "Inner value", mode = { "o", "x" } },
      { "av", desc = "Around value", mode = { "o", "x" } },
      { "ik", desc = "Inner key", mode = { "o", "x" } },
      { "ak", desc = "Around key", mode = { "o", "x" } },
      { "iS", desc = "Inner subword", mode = { "o", "x" } },
      { "aS", desc = "Around subword", mode = { "o", "x" } },
      { "!", desc = "Diagnostic", mode = { "o", "x" } },
      { "|", desc = "Column", mode = { "o", "x" } },

      -- Spider motions (enhanced w/e/b)
      { "w", desc = "Smart forward word (Spider)", mode = { "n", "o", "x" } },
      { "e", desc = "Smart end word (Spider)", mode = { "n", "o", "x" } },
      { "b", desc = "Smart backward word (Spider)", mode = { "n", "o", "x" } },
      { "ge", desc = "Smart backward end (Spider)", mode = { "n", "o", "x" } },

      -- Colorizer toggle
      { "<leader>uC", desc = "Toggle Colorizer" },
    })
  end,
}
