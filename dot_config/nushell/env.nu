# env.nu
#
# Installed by:
# version = "0.113.1"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.

$env.EDITOR = "nvim"
$env.XDG_CONFIG_HOME = ($nu.home-path | path join ".config")
$env.YAZI_CONFIG_HOME = ($nu.home-path | path join ".config" "yazi")

# Cross-platform safe Starship style paths
let style1 = ($nu.home-path | path join ".config" "starship-styles" "starship.toml")
let style2 = ($nu.home-path | path join ".config" "starship-styles" "starship.color.toml")
let state_file = ($nu.home-path | path join ".config" "starship-styles" ".starship_current_style")

if ($state_file | path exists) {
    let saved_style = (open $state_file | str trim)
    if $saved_style == "style2" {
        $env.STARSHIP_CONFIG = $style2
    } else {
        $env.STARSHIP_CONFIG = $style1
    }
} else {
    # Default fallback if no state file exists yet
    $env.STARSHIP_CONFIG = $style1
}

# NixOS Safe Vendor Autoload Init
# Creates directory only if it is writable, otherwise uses home fallback
let autoload_dir = ($nu.data-dir | path join "vendor/autoload")
try {
    if not ($autoload_dir | path exists) { mkdir $autoload_dir }
    ^starship init nu | save -f ($autoload_dir | path join "starship.nu")
} catch {
    # Fallback for read-only Nix architectures
    let user_autoload = ($nu.home-path | path join ".local" "share" "nushell" "vendor" "autoload")
    if not ($user_autoload | path exists) { mkdir -p $user_autoload }
    ^starship init nu | save -f ($user_autoload | path join "starship.nu")
}
