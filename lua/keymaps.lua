-- File operations
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Buffer navigation
vim.keymap.set("n", "<leader>n", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>p", ":bprev<CR>", { desc = "Previous buffer" })

-- Window splitting
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>s", ":split<CR>", { desc = "Horizontal split" })

-- Window navigation with Ctrl+hjkl
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- Telescope keymaps
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Recent files" })
vim.keymap.set("n", "<leader>fc", ":Telescope colorscheme<CR>", { desc = "Choose colorscheme" })

-- Neo-tree
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>o", ":Neotree focus<CR>", { desc = "Focus file explorer" })

-- Terminal (ToggleTerm)
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { desc = "Terminal float" })
vim.keymap.set(
  "n",
  "<leader>th",
  ":ToggleTerm direction=horizontal<CR>",
  { desc = "Terminal horizontal" }
)
vim.keymap.set(
  "n",
  "<leader>tv",
  ":ToggleTerm direction=vertical<CR>",
  { desc = "Terminal vertical" }
)

-- Session management
vim.keymap.set("n", "<leader>ss", ":AutoSession save<CR>", { desc = "Save session" })
vim.keymap.set("n", "<leader>sr", ":AutoSession restore<CR>", { desc = "Restore session" })
vim.keymap.set("n", "<leader>sd", ":AutoSession delete<CR>", { desc = "Delete session" })
