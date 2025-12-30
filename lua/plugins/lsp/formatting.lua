require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black", "isort" },
    c = { "clang-format" },
    cpp = { "clang-format" },
  },

  formatters = {
    stylua = {
      prepend_args = {
        "--indent-type", "Spaces",
        "--indent-width", "2",
        "--column-width", "100",
      },
    },
    ["clang-format"] = {
      prepend_args = {
        "--style={IndentWidth: 2, TabWidth: 2, UseTab: Never, ColumnLimit: 100}",
      },
    },
    black = {
      prepend_args = {
        "--line-length", "100",
      },
    },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
