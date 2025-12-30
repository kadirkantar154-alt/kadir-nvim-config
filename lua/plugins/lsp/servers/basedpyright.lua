local M = {}

M.setup = function(capabilities)
  vim.lsp.config("basedpyright", {
    capabilities = capabilities,
    on_attach = require("plugins.lsp.keymaps").on_attach,

    settings = {
      basedpyright = {
        analysis = {
          -- Reduce “bunch of errors”
          typeCheckingMode = "standard", -- less strict than basedpyright defaults :contentReference[oaicite:3]{index=3}
          diagnosticMode = "openFilesOnly", -- show diagnostics only for open buffers :contentReference[oaicite:4]{index=4}

          -- Game-dev friendly: reduce noise from dynamic libs / missing stubs
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,

          -- Common “spam” rules to quiet (tweak as you like)
          reportMissingImports = "none",
          reportMissingModuleSource = "none",
          reportMissingTypeStubs = "none",

          -- Optional: keep this low-noise
          reportUnusedImport = "warning",
        },
        python = {
          venvPath = "/path/to/venv",
          venv = "venv",
        },
      },
    },
  })

  vim.lsp.enable("basedpyright")
end

return M
