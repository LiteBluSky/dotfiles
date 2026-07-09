return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    -- Toggles the default/current terminal
    { "<leader>ft", "<cmd>execute v:count . 'ToggleTerm direction=float'<cr>", desc = "Toggle Terminal" },
  },
  opts = {
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_mode = false,
    shell = "nu",

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

    -- Smooth close with Ctrl+o
    vim.keymap.set("t", "<C-o>", [[<C-\><C-n><cmd>ToggleTerm direction=float<cr>]], { desc = "Toggle Terminal" })
  end,
}
