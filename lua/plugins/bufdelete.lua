return {
  "famiu/bufdelete.nvim",
  cmd = { "Bdelete", "Bwipeout" },
  keys = {
    { "<leader>bd", "<cmd>Bdelete<CR>", desc = "Delete buffer (keep window)" },
    { "<leader>bD", "<cmd>Bdelete!<CR>", desc = "Delete buffer (force)" },
    { "<leader>bw", "<cmd>Bwipeout<CR>", desc = "Wipeout buffer" },
  },
}
