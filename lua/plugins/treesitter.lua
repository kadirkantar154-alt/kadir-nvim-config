return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.config").setup({
      -- Install parsers for these languages
      ensure_installed = { 
        "c", "cpp", "lua", "vim", "vimdoc", "query",
        "python", "javascript", "typescript", "html", "css",
        "bash", "json", "markdown", "markdown_inline"
      },
      
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      
      -- Automatically install missing parsers when entering buffer
      auto_install = true,
      
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      
      indent = {
        enable = true
      },
    })
  end,
}
