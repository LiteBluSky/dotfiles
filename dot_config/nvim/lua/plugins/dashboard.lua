return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        width = 16,
        preset = {
          keys = {
            { icon = "󰱼", key = "f", desc = "[F]ind file", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = "", key = "n", desc = "[N]ew file", action = ":ene | startinsert" },
            { icon = "", key = "g", desc = "[G]rep text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = "󰒮", key = "r", desc = "[R]ecent file", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = "",
              key = "c",
              desc = "[C]onfig",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = "", key = "s", desc = "[S]ession", section = "session" },
            { icon = "󰬇", key = "L", desc = "[L]azy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            {
              icon = "󰬅",
              key = "x",
              desc = "[X]tras",
              action = ":LazyExtras",
              enabled = package.loaded.lazy ~= nil,
            },
            { icon = "", key = "q", desc = "[Q]uit", action = ":qa" },
          },
          header = [[
 █████                                       ███████████    ███                   
░░███                                       ░░███░░░░░███  ░░░                    
 ░███         ██████    █████████ █████ ████ ░███    ░███  ████   ██████   ██████ 
 ░███        ░░░░░███  ░█░░░░███ ░░███ ░███  ░██████████  ░░███  ███░░███ ███░░███
 ░███         ███████  ░   ███░   ░███ ░███  ░███░░░░░███  ░███ ░███ ░░░ ░███████ 
 ░███      █ ███░░███    ███░   █ ░███ ░███  ░███    ░███  ░███ ░███  ███░███░░░  
 ███████████░░████████  █████████ ░░███████  █████   █████ █████░░██████ ░░██████ 
░░░░░░░░░░░  ░░░░░░░░  ░░░░░░░░░   ░░░░░███ ░░░░░   ░░░░░ ░░░░░  ░░░░░░   ░░░░░░  
                                   ███ ░███                           Rice Config.
                                  ░░██████                                        
                                   ░░░░░░                                         
          ]],
        },
        formats = {
          key = { "" },
        },
      },
    },
  },
}
