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

    -- Register all keybindings with descriptions
    wk.add({
      -- File operations
      { "<leader>w",  ":w<CR>",                      desc = "Save file" },
      { "<leader>q",  ":q<CR>",                      desc = "Quit" },

      -- Buffer navigation
      { "<leader>n",  ":bnext<CR>",                  desc = "Next buffer" },
      { "<leader>p",  ":bprev<CR>",                  desc = "Previous buffer" },

      -- Window splitting
      { "<leader>v",  ":vsplit<CR>",                 desc = "Vertical split" },
      { "<leader>s",  ":split<CR>",                  desc = "Horizontal split" },

      -- Telescope group
      { "<leader>f",  group = "Find" },
      { "<leader>ff", ":Telescope find_files<CR>",   desc = "Find files" },
      { "<leader>fg", ":Telescope live_grep<CR>",    desc = "Live grep" },
      { "<leader>fb", ":Telescope buffers<CR>",      desc = "Find buffers" },
      { "<leader>fh", ":Telescope help_tags<CR>",    desc = "Help tags" },
      { "<leader>fr", ":Telescope oldfiles<CR>",     desc = "Recent files" },
      { "<leader>fc", ":Telescope colorscheme<CR>",  desc = "Choose colorscheme" },

      -- Window navigation (for reference, though Ctrl maps don't show in which-key)
      { "<C-h>",      "<C-w>h",                      desc = "Move to left split",   mode = "n" },
      { "<C-j>",      "<C-w>j",                      desc = "Move to bottom split", mode = "n" },
      { "<C-k>",      "<C-w>k",                      desc = "Move to top split",    mode = "n" },
      { "<C-l>",      "<C-w>l",                      desc = "Move to right split",  mode = "n" },

      -- NeoTree
      { "<leader>e",  ":Neotree toggle<CR>",         desc = "Toggle explorer" },
      { "<leader>o",  ":Neotree focus<CR>",          desc = "Focus explorer" },

      -- LSP
      { "<leader>c",  group = "Code" },
      { "<leader>ca", desc = "Code action" },
      { "<leader>rn", desc = "Rename" },
      { "<leader>fm", desc = "Format" },
      { "<leader>d",  desc = "Show diagnostic" },
      { "<leader>x",  group = "Trouble/Diagnostics" },
      { "<leader>xx", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", desc = "Buffer Diagnostics" },
      { "<leader>xL", desc = "Location List" },
      { "<leader>xQ", desc = "Quickfix List" },
      { "<leader>gg", desc = "LazyGit" },

    })
  end,
}
