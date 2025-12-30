-- Set your preferred colorscheme
local colorscheme = "gruvbox"  -- Options: gruvbox, nord, tokyonight, catppuccin, onedark

-- Try to load colorscheme
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found! Installing plugins...")
  return
end

-- Optional: Customize settings
vim.opt.background = "dark"  -- or "light"
