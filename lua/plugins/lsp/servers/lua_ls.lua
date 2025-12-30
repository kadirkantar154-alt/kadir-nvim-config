local M = {}

M.setup = function(capabilities)
  vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    on_attach = require("plugins.lsp.keymaps").on_attach,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        },
        telemetry = {
          enable = false,
        },
      },
    },
  })
  vim.lsp.enable('lua_ls')
end

return M
