return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    -- Extract function (visual mode)
    {
      "<leader>re",
      function()
        require("refactoring").refactor("Extract Function")
      end,
      mode = "x",
      desc = "Extract Function",
    },
    -- Extract function to file (visual mode)
    {
      "<leader>rf",
      function()
        require("refactoring").refactor("Extract Function To File")
      end,
      mode = "x",
      desc = "Extract Function To File",
    },
    -- Extract variable (visual mode)
    {
      "<leader>rv",
      function()
        require("refactoring").refactor("Extract Variable")
      end,
      mode = "x",
      desc = "Extract Variable",
    },
    -- Inline variable (normal and visual mode)
    {
      "<leader>ri",
      function()
        require("refactoring").refactor("Inline Variable")
      end,
      mode = { "n", "x" },
      desc = "Inline Variable",
    },
    -- Extract block (normal mode)
    {
      "<leader>rb",
      function()
        require("refactoring").refactor("Extract Block")
      end,
      mode = "n",
      desc = "Extract Block",
    },
    -- Extract block to file (normal mode)
    {
      "<leader>rF",
      function()
        require("refactoring").refactor("Extract Block To File")
      end,
      mode = "n",
      desc = "Extract Block To File",
    },
    -- Refactoring menu (visual mode) - uses telescope
    {
      "<leader>rr",
      function()
        require("refactoring").select_refactor()
      end,
      mode = "x",
      desc = "Refactoring menu",
    },
  },
  config = function()
    require("refactoring").setup({
      -- Show prompt for return type in extract function
      prompt_func_return_type = {
        go = false,
        java = false,
        cpp = true,
        c = true,
        h = false,
        hpp = false,
        cxx = false,
      },
      -- Show prompt for function parameters
      prompt_func_param_type = {
        go = false,
        java = false,
        cpp = true,
        c = true,
        h = false,
        hpp = false,
        cxx = false,
      },
      -- Printf statements for debugging
      printf_statements = {},
      -- Print variable statements
      print_var_statements = {},
    })

    -- Optional: Load refactoring Telescope extension for visual menu
    -- Uncomment if you want the telescope picker
    -- require("telescope").load_extension("refactoring")
  end,
}
