local M = {}

M.on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, silent = true }

  -- Go to definition/declaration
  vim.keymap.set(
    "n",
    "gd",
    vim.lsp.buf.definition,
    vim.tbl_extend("force", opts, { desc = "Go to definition" })
  )
  vim.keymap.set(
    "n",
    "gD",
    vim.lsp.buf.declaration,
    vim.tbl_extend("force", opts, { desc = "Go to declaration" })
  )
  vim.keymap.set(
    "n",
    "gi",
    vim.lsp.buf.implementation,
    vim.tbl_extend("force", opts, { desc = "Go to implementation" })
  )
  vim.keymap.set(
    "n",
    "gr",
    vim.lsp.buf.references,
    vim.tbl_extend("force", opts, { desc = "Show references" })
  )

  -- Hover and help
  vim.keymap.set(
    "n",
    "K",
    vim.lsp.buf.hover,
    vim.tbl_extend("force", opts, { desc = "Hover documentation" })
  )
  vim.keymap.set(
    "n",
    "<C-k>",
    vim.lsp.buf.signature_help,
    vim.tbl_extend("force", opts, { desc = "Signature help" })
  )

  -- Code actions and refactoring
  vim.keymap.set(
    "n",
    "<leader>ca",
    vim.lsp.buf.code_action,
    vim.tbl_extend("force", opts, { desc = "Code action" })
  )

  -- Diagnostics
  vim.keymap.set(
    "n",
    "[d",
    vim.diagnostic.goto_prev,
    vim.tbl_extend("force", opts, { desc = "Previous diagnostic" })
  )
  vim.keymap.set(
    "n",
    "]d",
    vim.diagnostic.goto_next,
    vim.tbl_extend("force", opts, { desc = "Next diagnostic" })
  )
  vim.keymap.set(
    "n",
    "<leader>d",
    vim.diagnostic.open_float,
    vim.tbl_extend("force", opts, { desc = "Show diagnostic" })
  )

  -- Formatting
  vim.keymap.set("n", "<leader>fm", function()
    require("conform").format({ lsp_fallback = true })
  end, vim.tbl_extend("force", opts, { desc = "Format file" }))
end

return M
