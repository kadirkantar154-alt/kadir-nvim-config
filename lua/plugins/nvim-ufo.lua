return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  event = "BufReadPost",
  keys = {
    {
      "zR",
      function()
        require("ufo").openAllFolds()
      end,
      desc = "Open all folds",
    },
    {
      "zM",
      function()
        require("ufo").closeAllFolds()
      end,
      desc = "Close all folds",
    },
    {
      "zr",
      function()
        require("ufo").openFoldsExceptKinds()
      end,
      desc = "Open folds except kinds",
    },
    {
      "zm",
      function()
        require("ufo").closeFoldsWith()
      end,
      desc = "Close folds with",
    },
    -- Preview fold without opening
    {
      "zp",
      function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end,
      desc = "Peek fold",
    },
  },
  config = function()
    -- UFO folding
    require("ufo").setup({
      -- Using treesitter and LSP for fold detection
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
      -- Fold preview configuration
      preview = {
        win_config = {
          border = "rounded",
          winblend = 0,
          winhighlight = "Normal:Normal",
        },
        mappings = {
          scrollU = "<C-u>",
          scrollD = "<C-d>",
          jumpTop = "[",
          jumpBot = "]",
        },
      },
      -- Fold text customization
      fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = ("  %d lines "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0

        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end

        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end,
    })

    -- Set fold options
    vim.o.foldcolumn = "1" -- Show fold column
    vim.o.foldlevel = 99 -- Using ufo provider need a large value
    vim.o.foldlevelstart = 99 -- Start with all folds open
    vim.o.foldenable = true -- Enable folding
  end,
}
