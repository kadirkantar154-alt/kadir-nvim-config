return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("illuminate").configure({
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      delay = 100,
      filetypes_denylist = {
        "dirvish",
        "fugitive",
        "alpha",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
      },
      under_cursor = true,
    })

    vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Search" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "IncSearch" })
  end,
}
