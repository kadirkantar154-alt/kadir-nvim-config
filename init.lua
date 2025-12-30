-- Set mapLeader
vim.g.mapleader = " "

-- Load lazy.nvim first
require("lazy-setup")

-- Then load other modules
require("options")
require("keymaps")
require("colorscheme")
