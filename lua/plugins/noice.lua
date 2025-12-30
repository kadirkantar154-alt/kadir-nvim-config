return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify", -- Make sure notify is loaded first
  },
  config = function()
    require("noice").setup({
      -- LSP progress and hover doc styling
      lsp = {
        override = {
          -- Override markdown rendering for LSP hover/signature
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        -- Hover and signature help
        hover = {
          enabled = true,
          silent = false,
        },
        signature = {
          enabled = true,
          auto_open = {
            enabled = true,
            trigger = true,
            luasnip = true,
            throttle = 50,
          },
        },
        -- Progress messages (like "LSP starting...")
        progress = {
          enabled = true,
          format = "lsp_progress",
          format_done = "lsp_progress_done",
        },
        message = {
          enabled = true,
        },
        documentation = {
          view = "hover",
          opts = {
            lang = "markdown",
            replace = true,
            render = "plain",
            format = { "{message}" },
            win_options = { concealcursor = "n", conceallevel = 3 },
          },
        },
      },
      
      -- Message display
      messages = {
        enabled = true,
        view = "notify", -- Use notify for messages
        view_error = "notify",
        view_warn = "notify",
        view_history = "messages",
        view_search = "virtualtext",
      },
      
      -- Popupmenu (completion menu)
      popupmenu = {
        enabled = true,
        backend = "nui", -- or "cmp"
      },
      
      -- Command line
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
        format = {
          cmdline = { pattern = "^:", icon = "", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
          filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
          lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
          help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
        },
      },
      
      -- Presets for common configurations
      presets = {
        bottom_search = true, -- Use classic bottom search
        command_palette = true, -- Position cmdline and popupmenu together
        long_message_to_split = true, -- Long messages in a split
        inc_rename = false, -- Enables input dialog for inc-rename.nvim
        lsp_doc_border = true, -- Add border to hover docs and signature help
      },
      
      -- Routes for message handling
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "%d+L, %d+B",
          },
          opts = { skip = true },
        },
      },
      
      -- Views configuration
      views = {
        cmdline_popup = {
          position = {
            row = 5,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = "Normal:Normal,FloatBorder:DiagnosticInfo",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },
    })
    
    -- Keymaps
    vim.keymap.set("n", "<leader>nl", function()
      require("noice").cmd("last")
    end, { desc = "Noice last message" })
    
    vim.keymap.set("n", "<leader>nh", function()
      require("noice").cmd("history")
    end, { desc = "Noice history" })
    
    vim.keymap.set("n", "<leader>na", function()
      require("noice").cmd("all")
    end, { desc = "Noice all messages" })
    
    vim.keymap.set("n", "<leader>nd", function()
      require("noice").cmd("dismiss")
    end, { desc = "Dismiss Noice messages" })
  end,
}
