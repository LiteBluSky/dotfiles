-- return {
--   {
--     "catppuccin/nvim",
--     -- commit = "8c302e5",
--     lazy = true,
--     name = "catppuccin",
--     opts = {
--       transparent_background = true,
--       flavour = "frappe",
--       integrations = {
--         aerial = true,
--         alpha = true,
--         cmp = true,
--         dashboard = true,
--         flash = true,
--         fzf = true,
--         grug_far = true,
--         gitsigns = true,
--         headlines = true,
--         illuminate = true,
--         indent_blankline = { enabled = true },
--         leap = true,
--         lsp_trouble = true,
--         mason = true,
--         markdown = true,
--         mini = true,
--         native_lsp = {
--           enabled = true,
--           underlines = {
--             errors = { "undercurl" },
--             hints = { "undercurl" },
--             warnings = { "undercurl" },
--             information = { "undercurl" },
--           },
--         },
--         navic = { enabled = true, custom_bg = "lualine" },
--         neotest = true,
--         neotree = true,
--         noice = true,
--         notify = true,
--         semantic_tokens = true,
--         snacks = true,
--         telescope = true,
--         treesitter = true,
--         treesitter_context = true,
--         which_key = true,
--       },
--     },
--     specs = {
--       {
--         "akinsho/bufferline.nvim",
--         optional = true,
--         opts = function(_, opts)
--           if (vim.g.colors_name or ""):find("catppuccin") then
--             opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
--           end
--         end,
--       },
--     },
--   },
-- }
-- File: lua/plugins/colorscheme.lua
-- File: lua/plugins/colorscheme.lua
-- lua/plugins/colorscheme.lua

-- return {
--   {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     lazy = true,
--     opts = {
--       transparent_background = true,
--       flavour = "frappe",
--       integrations = {
--         yazi = true,
--         aerial = true,
--         alpha = true,
--         cmp = true,
--         dashboard = true,
--         flash = true,
--         fzf = true,
--         grug_far = true,
--         gitsigns = true,
--         headlines = true,
--         illuminate = true,
--         indent_blankline = { enabled = true },
--         leap = true,
--         lsp_trouble = true,
--         mason = true,
--         markdown = true,
--         mini = true,
--         native_lsp = {
--           enabled = true,
--           underlines = {
--             errors = { "undercurl" },
--             hints = { "undercurl" },
--             warnings = { "undercurl" },
--             information = { "undercurl" },
--           },
--         },
--         navic = { enabled = true, custom_bg = "lualine" },
--         neotest = true,
--         neotree = true,
--         noice = true,
--         notify = true,
--         semantic_tokens = true,
--         snacks = true,
--         telescope = true,
--         treesitter = true,
--         treesitter_context = true,
--         which_key = true,
--         bufferline = true, -- ✅ new-style integration flag
--       },
--     },
--   },
-- }

return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  opts = {
    lsp_styles = {
      underlines = {
        errors = { "undercurl" },
        hints = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
      },
    },
    transparent_background = true,
    flavour = "frappe",
    float = { transparent = true },
    integrations = {
      yazi = true,
      aerial = true,
      alpha = true,
      cmp = true,
      dashboard = true,
      flash = true,
      fzf = true,
      grug_far = true,
      gitsigns = true,
      headlines = true,
      illuminate = true,
      indent_blankline = { enabled = true },
      leap = true,
      lsp_trouble = true,
      mason = true,
      mini = true,
      navic = { enabled = true, custom_bg = "lualine" },
      neotest = true,
      neotree = true,
      noice = true,
      notify = true,
      snacks = true,
      telescope = true,
      treesitter_context = true,
      which_key = true,
      bufferline = true,
    },
  },
  specs = {
    {
      "akinsho/bufferline.nvim",
      optional = true,
      opts = function(_, opts)
        if (vim.g.colors_name or ""):find("catppuccin-nvim") then
          opts.highlights = require("catppuccin.special.bufferline").get_theme()
        end
      end,
    },
  },
}
