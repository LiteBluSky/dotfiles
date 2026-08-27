# config.nu
#
# Installed by:
# version = "0.113.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R
$env.config.show_banner = false
$env.config.shell_integration.osc133 = false

let home_dir = ($env | get -o HOME | default ($env | get -o USERPROFILE))
$env.PATH = ($env.PATH | split row (char env_sep) | append ($home_dir | path join ".local" "bin") | uniq)

# (We replace the PowerShell %USERPROFILE% syntax with clean string manipulation)
# clear
# let logo_path = ($home_dir | path join ".config" "fastfetch-icons" "massive-fastfetch-logo.txt")
# sleep 600ms
# ^fastfetch --logo-padding-top 2 -l $logo_path

# ==========================================
# VIM MODE & INTERACTIVE COMPLETIONS
# ==========================================
$env.config.edit_mode = "vi"

# Predictive IntelliSense (Fish-style ghost text) is built directly into Nushell/Reedline:
$env.config.completions.quick = true
$env.config.cursor_shape.vi_insert = "block"
$env.config.cursor_shape.vi_normal = "underscore"

# Note: Nushell natively maps Up/Down arrows and 'j'/'k' inside Vi-Command mode 
# to perform physical history searches automatically! No extra clunky script blocks needed.

# Map 'Ctrl + k' to accept ghost-text suggestions natively
$env.config.keybindings = ($env.config.keybindings? | default []) ++ [
     {
         name: accept_hint
         modifier: control
         keycode: char_k
         mode: [vi_insert emacs]
         event: { send: HistoryHintComplete }
     }
]

# ==========================================
# FUNCTIONS & ALIASES
# ==========================================

# File explorer shorthand alias
alias e = explorer .

# Custom cross-platform Yazi wrapper function
# Changes your directory cleanly upon closing the file manager interface
def --env y [...args] {
    let tmp = (mktemp -t "yazi-cwd.XXXXXX")
    ^yazi ...$args --cwd-file $tmp
    let cwd = (open $tmp)
    if $cwd != $env.PWD and ($cwd | path exists) {
        cd $cwd
    }
    rm -fp $tmp
}

# Starship Toggle Styles Function
def --env tp [] {
    let style1 = ($home_dir | path join ".config" "starship-styles" "starship.toml")
    let style2 = ($home_dir | path join ".config" "starship-styles" "starship.color.toml")
    let state_file = ($home_dir | path join ".config" "starship-styles" ".starship_current_style")

    if $env.STARSHIP_CONFIG == $style1 {
        $env.STARSHIP_CONFIG = $style2
        "style2" | save -f $state_file
        print $"(ansi cyan)🚀 Switched to Starship Style 2 (ansi reset)"
    } else {
        $env.STARSHIP_CONFIG = $style1
        "style1" | save -f $state_file
        print $"(ansi magenta)✨ Switched to Starship Style 1 (ansi reset)"
    }
}

def --env ff [] {
  clear
  let logo_path = ($home_dir | path join ".config" "fastfetch-icons" "massive-fastfetch-logo.txt")
  sleep 600ms
  ^fastfetch --logo-padding-top 2 -l $logo_path
}

$env.PROMPT_INDICATOR_VI_INSERT = { || 
    (ansi cyan_bold) + "╰────> " + (ansi reset) 
}
$env.PROMPT_INDICATOR_VI_NORMAL = { || 
    (ansi magenta_bold) + "╰─ ─▶ " + (ansi reset) 
}
$env.PROMPT_INDICATOR = { || (ansi cyan_bold) + "╰────> " + (ansi reset) }
