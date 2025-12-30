return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      search = { enabled = false }, -- keep / and ? default unless you want flash search takeover
      char = { enabled = true },
    },
  },
  keys = {
    {
      "s",
      function()
        require("flash").jump()
      end,
      mode = { "n", "x", "o" },
      desc = "Flash jump",
    },
    {
      "S",
      function()
        require("flash").treesitter()
      end,
      mode = { "n", "x", "o" },
      desc = "Flash Treesitter",
    },
    {
      "r",
      function()
        require("flash").remote()
      end,
      mode = "o",
      desc = "Flash remote",
    },
    {
      "R",
      function()
        require("flash").treesitter_search()
      end,
      mode = { "n", "o" },
      desc = "Flash TS search",
    },
  },
}
