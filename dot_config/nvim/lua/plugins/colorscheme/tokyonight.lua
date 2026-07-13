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
  {
    "folke/tokyonight.nvim",
    lazy = false, -- Colorschemes should load immediately to avoid screen flash
    priority = 1000, -- Load this before all other plugins
    opts = {
      style = "storm", -- Sets the exact match for your WezTerm theme
      transparent = true, -- Enables transparent background
      styles = {
        sidebars = "transparent", -- Makes nvim-tree/neo-tree background transparent
        floats = "transparent", -- Makes telescope/lsp hover transparent
      },
      on_colors = function(colors)
        colors.bg_statusline = colors.none -- Forces lualine's background to be clear
      end,
      -- on_highlights = function(hl, c)
      --   hl.CursorLine = { bg = c.bg_highlight }
      -- end,
      -- This matches your old custom undercurl settings for LSP diagnostics
      -- on_highlights = function(hl, c)
      --   hl.DiagnosticUnderlineError = { undercurl = true, sp = c.error }
      --   hl.DiagnosticUnderlineHint = { undercurl = true, sp = c.hint }
      --   hl.DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning }
      --   hl.DiagnosticUnderlineInfo = { undercurl = true, sp = c.info }
      -- end,
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        -- opts = function(_, opts)
        --   if (vim.g.colors_name or ""):find("tokyonight") then
        --     opts.options = opts.options or {}
        --   end
        -- end,
      },
    },
  },
}
