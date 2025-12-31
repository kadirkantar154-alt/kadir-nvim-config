return {
  "gbprod/substitute.nvim",
  event = "VeryLazy",
  keys = {
    -- Substitute operator (replaces with yanked text)
    {
      "gs",
      function()
        require("substitute").operator()
      end,
      desc = "Substitute operator",
      mode = "n",
    },
    -- Substitute line
    {
      "gss",
      function()
        require("substitute").line()
      end,
      desc = "Substitute line",
      mode = "n",
    },
    -- Substitute to end of line
    {
      "gS",
      function()
        require("substitute").eol()
      end,
      desc = "Substitute to EOL",
      mode = "n",
    },
    -- Substitute in visual mode
    {
      "gs",
      function()
        require("substitute").visual()
      end,
      desc = "Substitute visual",
      mode = "x",
    },

    -- Exchange operator (swap two regions)
    {
      "gx",
      function()
        require("substitute.exchange").operator()
      end,
      desc = "Exchange operator",
      mode = "n",
    },
    -- Exchange line
    {
      "gxx",
      function()
        require("substitute.exchange").line()
      end,
      desc = "Exchange line",
      mode = "n",
    },
    -- Exchange visual
    {
      "gx",
      function()
        require("substitute.exchange").visual()
      end,
      desc = "Exchange visual",
      mode = "x",
    },
    -- Cancel exchange
    {
      "gxc",
      function()
        require("substitute.exchange").cancel()
      end,
      desc = "Cancel exchange",
      mode = "n",
    },
  },
  config = function()
    require("substitute").setup({
      -- Show message on substitute
      on_substitute = function()
        vim.notify("Substituted!", vim.log.levels.INFO, { timeout = 500 })
      end,
      -- Highlight substituted text briefly
      highlight_substituted_text = {
        enabled = true,
        timer = 200,
      },
      -- Integration with yanky/registers
      range = {
        prefix = "gs",
        prompt_current_text = false,
        confirm = false,
        complete_word = false,
        subject = nil,
        range = nil,
        suffix = "",
        auto_apply = false,
        cursor_position = "end",
      },
      exchange = {
        motion = false,
        use_esc_to_cancel = true,
        preserve_cursor_position = false,
      },
    })

    -- Optional: Add visual feedback for exchange marks
    vim.api.nvim_set_hl(0, "SubstituteExchange", { link = "Search" })
  end,
}
