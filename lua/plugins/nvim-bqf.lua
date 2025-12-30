return {
  "kevinhwang91/nvim-bqf",
  ft = "qf", -- Only load when quickfix window opens
  config = function()
    require("bqf").setup({
      -- Automatically resize quickfix window height
      auto_resize_height = true,

      -- Preview window configuration
      preview = {
        win_height = 12,
        win_vheight = 12,
        delay_syntax = 80,
        border = "rounded",
        show_title = true,
        should_preview_cb = function(bufnr, qwinid)
          local ret = true
          local bufname = vim.api.nvim_buf_get_name(bufnr)
          local fsize = vim.fn.getfsize(bufname)

          if fsize > 100 * 1024 then
            ret = false
          elseif bufname:match("^fugitive://") then
            ret = false
          end

          return ret
        end,
        wrap = false,
      },

      -- Function to filter items in quickfix list
      func_map = {
        vsplit = "",
        ptogglemode = "z,",
        stoggleup = "",
        stoggledown = "",
        stogglevm = "",
        stogglebuf = "'<Tab>",
        sclear = "z<Tab>",
        pscrollup = "<C-b>",
        pscrolldown = "<C-f>",
        pscrollorig = "zo",
        ptoggleauto = "zp",
        open = "<CR>",
        openc = "o",
        drop = "O",
        tabdrop = "",
        tabc = "",
        tab = "t",
        tabb = "T",
        split = "<C-x>",
        prevfile = "<C-p>",
        nextfile = "<C-n>",
        prevhist = "<",
        nexthist = ">",
        lastleave = [['"]],
        filter = "zn",
        filterr = "zN",
      },

      filter = {
        fzf = {
          action_for = { ["ctrl-s"] = "split", ["ctrl-t"] = "tab drop" },
          extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
        },
      },

      magic_window = {
        enable = true,
      },
    })

    -- CHANGED: Use <leader>x prefix instead of <leader>q (which closes Neovim)
    -- "x" is close to "q" and makes sense (like "quickfiX")

    -- Quickfix keymaps (using <leader>x prefix)
    vim.keymap.set("n", "<leader>xo", "<cmd>copen<CR>", { desc = "Open quickfix" })
    vim.keymap.set("n", "<leader>xc", "<cmd>cclose<CR>", { desc = "Close quickfix" })
    vim.keymap.set("n", "<leader>xn", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
    vim.keymap.set("n", "<leader>xp", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })
    vim.keymap.set("n", "<leader>xf", "<cmd>cfirst<CR>zz", { desc = "First quickfix item" })
    vim.keymap.set("n", "<leader>xl", "<cmd>clast<CR>zz", { desc = "Last quickfix item" })

    -- Alternative: Use ]q and [q for quick navigation (common vim pattern)
    vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
    vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz", { desc = "Previous quickfix" })

    -- Location list (using <leader>xl prefix)
    vim.keymap.set("n", "<leader>xlo", "<cmd>lopen<CR>", { desc = "Open location list" })
    vim.keymap.set("n", "<leader>xlc", "<cmd>lclose<CR>", { desc = "Close location list" })
    vim.keymap.set("n", "<leader>xln", "<cmd>lnext<CR>zz", { desc = "Next location item" })
    vim.keymap.set("n", "<leader>xlp", "<cmd>lprev<CR>zz", { desc = "Previous location item" })

    -- Alternative: Use ]l and [l for location list
    vim.keymap.set("n", "]l", "<cmd>lnext<CR>zz", { desc = "Next location" })
    vim.keymap.set("n", "[l", "<cmd>lprev<CR>zz", { desc = "Previous location" })

    -- Highlight quickfix line
    vim.cmd([[
      hi BqfPreviewBorder guifg=#3e8e2d ctermfg=71
      hi BqfPreviewTitle guifg=#3e8e2d ctermfg=71
      hi BqfPreviewThumb guibg=#3e8e2d ctermbg=71
      hi link BqfPreviewRange Search
    ]])

    -- Show notification about fzf (optional)
    vim.defer_fn(function()
      if vim.fn.executable("fzf") == 0 then
        vim.notify(
          "nvim-bqf: Basic filtering works (zn). For fuzzy filtering (zf), install fzf.",
          vim.log.levels.INFO,
          { title = "nvim-bqf" }
        )
      end
    end, 1000)
  end,
}
