return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
  config = function()
    -- Mini.ai: Extended text objects
    -- Adds many useful text objects like:
    -- - va) or vi) for parentheses
    -- - vaq or viq for quotes
    -- - vaa or via for arguments
    -- - vaf or vif for functions
    require("mini.ai").setup({
      n_lines = 500,
      search_method = "cover_or_next",
    })

    -- Mini.splitjoin: Toggle between single/multi-line code
    -- Use gS to toggle (default keybinding)
    require("mini.splitjoin").setup({
      mappings = {
        toggle = "gS", -- Toggle split/join
      },
    })

    -- Mini.move: Move lines and selections
    -- Using Alt (M) instead of Ctrl to avoid conflicts
    require("mini.move").setup({
      mappings = {
        -- Move visual selection in Visual mode
        left = "<M-h>",
        right = "<M-l>",
        down = "<M-j>",
        up = "<M-k>",

        -- Move current line in Normal mode
        line_left = "<M-h>",
        line_right = "<M-l>",
        line_down = "<M-j>",
        line_up = "<M-k>",
      },
    })

    -- Mini.bracketed: Navigate through various things with [ and ]
    -- Adds navigation for buffers, comments, conflicts, diagnostics, files, etc.
    require("mini.bracketed").setup({
      -- Use default mappings
      buffer = { suffix = "b", options = {} },
      comment = { suffix = "c", options = {} },
      conflict = { suffix = "x", options = {} },
      diagnostic = { suffix = "d", options = {} },
      file = { suffix = "f", options = {} },
      indent = { suffix = "i", options = {} },
      jump = { suffix = "j", options = {} },
      location = { suffix = "l", options = {} },
      oldfile = { suffix = "o", options = {} },
      quickfix = { suffix = "q", options = {} },
      treesitter = { suffix = "t", options = {} },
      undo = { suffix = "u", options = {} },
      window = { suffix = "w", options = {} },
      yank = { suffix = "y", options = {} },
    })

    -- Note: Mini.bracketed provides:
    -- [b / ]b - previous/next buffer
    -- [c / ]c - previous/next comment (may conflict with gitsigns, but gitsigns has priority)
    -- [d / ]d - previous/next diagnostic (already mapped in LSP, mini will not override)
    -- [f / ]f - previous/next file
    -- [q / ]q - previous/next quickfix (already mapped in nvim-bqf, but these are aliases)
    -- And many more...
  end,
}
