-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>O", function()
  local file_dir = vim.fn.expand("%:p:h")
  os.execute('start "" "' .. file_dir .. '"')
end, { desc = "Open Windows Explorer at current file" })
