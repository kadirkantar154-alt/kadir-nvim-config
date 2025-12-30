return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("illuminate").configure({
      providers = {
        'lsp',
        'treesitter',
        'regex',
      },
      delay = 100,
      filetypes_denylist = {
        'dirvish',
        'fugitive',
        'alpha',
        'neo-tree',
        'Trouble',
        'lazy',
        'mason',
      },
      under_cursor = true,
    })

    -- Bold and colorful style (adjust colors to match your theme)
    vim.api.nvim_set_hl(0, 'IlluminatedWordText', {
      bg = '#404040',
      fg = '#e0e0e0',
      bold = true,
      underline = true,
    })
    vim.api.nvim_set_hl(0, 'IlluminatedWordRead', {
      bg = '#2d3f4f', -- Blueish
      bold = true,
    })
    vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', {
      bg = '#4f2d2d', -- Reddish for variables being written to
      bold = true,
    })
  end,
}
