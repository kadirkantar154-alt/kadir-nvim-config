return {
  "chrisgrieser/nvim-various-textobjs",
  event = "VeryLazy",
  config = function()
    require("various-textobjs").setup({
      -- Use default keymaps (won't override existing ones)
      useDefaultKeymaps = true,

      -- Disable some keymaps to avoid conflicts
      disabledKeymaps = {
        "gc", -- Already used by Comment.nvim
      },
    })

    -- Custom keymaps for commonly used text objects
    local opts = { silent = true, desc = "Select entire buffer" }
    
    -- Entire buffer (useful for formatting/copying all)
    vim.keymap.set({ "o", "x" }, "gG", function()
      require("various-textobjs").entireBuffer()
    end, opts)

    -- Indentation (current indent level)
    vim.keymap.set({ "o", "x" }, "ii", function()
      require("various-textobjs").indentation("inner", "inner")
    end, { silent = true, desc = "Inner indentation" })

    vim.keymap.set({ "o", "x" }, "ai", function()
      require("various-textobjs").indentation("outer", "outer")
    end, { silent = true, desc = "Around indentation" })

    -- Rest of URL (great for editing links)
    vim.keymap.set({ "o", "x" }, "iL", function()
      require("various-textobjs").url()
    end, { silent = true, desc = "Inner URL" })

    -- Numbers
    vim.keymap.set({ "o", "x" }, "in", function()
      require("various-textobjs").number("inner")
    end, { silent = true, desc = "Inner number" })

    vim.keymap.set({ "o", "x" }, "an", function()
      require("various-textobjs").number("outer")
    end, { silent = true, desc = "Around number" })

    -- Values (right side of assignment)
    vim.keymap.set({ "o", "x" }, "iv", function()
      require("various-textobjs").value("inner")
    end, { silent = true, desc = "Inner value" })

    vim.keymap.set({ "o", "x" }, "av", function()
      require("various-textobjs").value("outer")
    end, { silent = true, desc = "Around value" })

    -- Keys (left side of assignment)
    vim.keymap.set({ "o", "x" }, "ik", function()
      require("various-textobjs").key("inner")
    end, { silent = true, desc = "Inner key" })

    vim.keymap.set({ "o", "x" }, "ak", function()
      require("various-textobjs").key("outer")
    end, { silent = true, desc = "Around key" })

    -- Subword (camelCase/snake_case parts)
    vim.keymap.set({ "o", "x" }, "iS", function()
      require("various-textobjs").subword("inner")
    end, { silent = true, desc = "Inner subword" })

    vim.keymap.set({ "o", "x" }, "aS", function()
      require("various-textobjs").subword("outer")
    end, { silent = true, desc = "Around subword" })

    -- Diagnostic (LSP diagnostics under cursor)
    vim.keymap.set({ "o", "x" }, "!", function()
      require("various-textobjs").diagnostic()
    end, { silent = true, desc = "Diagnostic" })

    -- Column (vertical selection)
    vim.keymap.set({ "o", "x" }, "|", function()
      require("various-textobjs").column()
    end, { silent = true, desc = "Column" })

    -- Note: Many other text objects are available with default keymaps:
    -- - if/af: inner/outer function
    -- - iC/aC: inner/outer class
    -- - im/am: inner/outer call (function call/method)
    -- - r: restOfParagraph
    -- - gw: visibleInWindow
    -- And many more! Check :h various-textobjs for full list
  end,
}
