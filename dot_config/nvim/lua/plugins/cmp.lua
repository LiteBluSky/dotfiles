return {
  { "L3MON4D3/LuaSnip", enabled = true },
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
    opts = function()
      -- The visual height of the popup window
      vim.opt.pumheight = 50
    end,
  },
  {
    {
      "saghen/blink.cmp",
      opts = {
        keymap = {
          preset = "enter", -- Options: 'default', 'super-tab', 'enter'
        },
        completion = {
          menu = {
            max_height = 50,
          },
        },
      },
    },
  },
}
