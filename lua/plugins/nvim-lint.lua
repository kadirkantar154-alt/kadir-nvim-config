return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      python = { "ruff" },
      c = { "clangtidy" },
      cpp = { "clangtidy" },
      lua = { "luacheck" },
    }

    local lint_enabled = true

    local function do_lint()
      if not lint_enabled then
        return
      end
      lint.try_lint()
    end

    -- lint on save (safe default)
    vim.api.nvim_create_autocmd({ "bufwritepost" }, {
      callback = do_lint,
    })

    -- manual lint
    vim.keymap.set("n", "<leader>ll", do_lint, { desc = "lint current file" })

    -- toggle linting
    vim.keymap.set("n", "<leader>lt", function()
      lint_enabled = not lint_enabled
      if lint_enabled then
        vim.notify("lint: enabled")
        do_lint()
      else
        vim.notify("lint: disabled")
      end
    end, { desc = "Toggle linting" })
  end,
}
