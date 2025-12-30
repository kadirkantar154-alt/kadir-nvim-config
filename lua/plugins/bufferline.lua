return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        numbers = "ordinal", -- Show buffer numbers
        close_command = "Bdelete! %d", -- Use bufdelete for closing
        right_mouse_command = "Bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        
        -- Diagnostics from LSP
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        
        -- Offset for neo-tree
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
            separator = true,
          },
        },
        
        -- Visual settings
        separator_style = "slant", -- or "thick", "thin", "slope", "padded_slant"
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
        },
      },
      highlights = {
        buffer_selected = {
          bold = true,
          italic = false,
        },
      },
    })
    
    -- Keymaps for buffer navigation
    vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>", { desc = "Pick buffer", silent = true })
    vim.keymap.set("n", "<leader>bc", ":BufferLinePickClose<CR>", { desc = "Pick buffer to close", silent = true })
    vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", { desc = "Next buffer", silent = true })
    vim.keymap.set("n", "<leader>bP", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer", silent = true })
    
    -- Move buffers
    vim.keymap.set("n", "<leader>bmn", ":BufferLineMoveNext<CR>", { desc = "Move buffer next", silent = true })
    vim.keymap.set("n", "<leader>bmp", ":BufferLineMovePrev<CR>", { desc = "Move buffer prev", silent = true })
    
    -- Go to buffer by number (Alt+number)
    for i = 1, 9 do
      vim.keymap.set("n", "<A-" .. i .. ">", ":BufferLineGoToBuffer " .. i .. "<CR>", 
        { desc = "Go to buffer " .. i, silent = true })
    end
  end,
}
