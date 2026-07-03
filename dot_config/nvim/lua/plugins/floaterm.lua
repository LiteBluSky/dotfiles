return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    -- Change "<leader>ft" to whatever key combination you prefer
    { "<leader>ft", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Floating Terminal" },
  },
  opts = {
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_mode = false, -- Changed to false so it FORCES insert mode every single open
    shell = 'pwsh -NoExit -Command ". $PROFILE"',

    float_opts = {
      border = "rounded",
      width = function()
        return math.floor(vim.o.columns * 0.8)
      end,
      height = function()
        return math.floor(vim.o.lines * 0.8)
      end,
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- 3. Close smoothly from Terminal Mode with Ctrl+O
    vim.keymap.set("t", "<C-o>", [[<C-\><C-n><cmd>ToggleTerm direction=float<cr>]], { desc = "Toggle Terminal" })
  end,
}
