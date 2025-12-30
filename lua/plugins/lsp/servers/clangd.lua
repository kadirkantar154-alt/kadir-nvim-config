local M = {}

M.setup = function(capabilities)
  vim.lsp.config('clangd', {
    capabilities = capabilities,
    on_attach = require("plugins.lsp.keymaps").on_attach,
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--completion-style=detailed",
    },
    filetypes = { "c", "cpp", "objc", "objcpp" },
  })

  vim.lsp.enable('clangd')
end

return M
