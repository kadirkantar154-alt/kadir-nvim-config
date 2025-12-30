local function apply_semantic_links()
  local links = {
    ["@lsp.type.class"] = "@type",
    ["@lsp.type.struct"] = "@type",
    ["@lsp.type.enum"] = "@type",
    ["@lsp.type.function"] = "@function",
    ["@lsp.type.method"] = "@function.method",
    ["@lsp.type.variable"] = "@variable",
    ["@lsp.type.parameter"] = "@parameter",
    ["@lsp.type.property"] = "@property",
    ["@lsp.type.namespace"] = "@namespace",
    ["@lsp.type.keyword"] = "@keyword",
    ["@lsp.type.comment"] = "@comment",
  }

  for from, to in pairs(links) do
    vim.api.nvim_set_hl(0, from, { link = to })
  end
end

-- apply now
apply_semantic_links()

-- apply again after any :colorscheme or theme reload
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = apply_semantic_links,
})
