return {
  "chrisgrieser/nvim-spider",
  event = "VeryLazy",
  keys = {
    {
      "w",
      "<cmd>lua require('spider').motion('w')<CR>",
      mode = { "n", "o", "x" },
      desc = "Spider-w (smart forward word)",
    },
    {
      "e",
      "<cmd>lua require('spider').motion('e')<CR>",
      mode = { "n", "o", "x" },
      desc = "Spider-e (smart end of word)",
    },
    {
      "b",
      "<cmd>lua require('spider').motion('b')<CR>",
      mode = { "n", "o", "x" },
      desc = "Spider-b (smart backward word)",
    },
    -- Optional: ge motion
    {
      "ge",
      "<cmd>lua require('spider').motion('ge')<CR>",
      mode = { "n", "o", "x" },
      desc = "Spider-ge (smart backward end)",
    },
  },
  config = function()
    require("spider").setup({
      -- Skip over insignificant punctuation
      skipInsignificantPunctuation = true,
      -- Consistent operator-pending behavior
      consistentOperatorPending = false,
      -- Subword movement (camelCase/snake_case)
      subwordMovement = true,
    })

    -- Optional: Add visual feedback
    vim.api.nvim_create_autocmd("User", {
      pattern = "SpiderMotion",
      callback = function()
        -- You can add custom behavior here if needed
      end,
    })
  end,
}
