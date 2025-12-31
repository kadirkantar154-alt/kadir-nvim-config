return {
  "NvChad/nvim-colorizer.lua",
  event = "BufReadPost",
  keys = {
    {
      "<leader>uC",
      "<cmd>ColorizerToggle<CR>",
      desc = "Toggle colorizer",
    },
  },
  config = function()
    require("colorizer").setup({
      filetypes = {
        "*", -- Highlight all files, but customize some others
        css = { css = true }, -- Enable parsing rgb(...) functions in css
        html = { names = false }, -- Disable parsing "names" like Blue in html
        "!lazy", -- Exclude lazy.nvim popup
      },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue (disable by default, can be noisy)
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = true, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background, virtualtext
        mode = "background", -- Set the display mode
        -- Available methods are false / true / "normal" / "lsp" / "both"
        tailwind = false, -- Enable tailwind colors
        sass = { enable = false }, -- Enable sass colors
        virtualtext = "■", -- Character to use for virtualtext
        always_update = false, -- Update color values even if buffer is not focused
      },
      -- All the buffer-local options can be overridden here
      buftypes = {},
    })

    -- Automatically enable for certain file types
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "css", "scss", "html", "javascript", "typescript", "lua" },
      callback = function()
        require("colorizer").attach_to_buffer(0)
      end,
    })
  end,
}
