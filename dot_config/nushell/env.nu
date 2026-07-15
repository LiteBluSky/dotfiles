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

let home_dir = ($env | get -o HOME | default ($env | get -o USERPROFILE))

$env.EDITOR = "nvim"
$env.XDG_CONFIG_HOME = ($home_dir | path join ".config")
$env.YAZI_CONFIG_HOME = ($home_dir | path join ".config" "yazi")
# $env.GLAZEWM_CONFIG_PATH = ($home_dir | path join ".config" "glazewm" "config.yaml")

let style1 = ($home_dir | path join ".config" "starship-styles" "starship.toml")
let style2 = ($home_dir | path join ".config" "starship-styles" "starship.color.toml")
let state_file = ($home_dir | path join ".config" "starship-styles" ".starship_current_style")

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

# Starship initialization sequence (Nushell Native Autoload method)
# This creates a cached loading script inside your Nushell vendor directory
mkdir ($nu.data-dir | path join "vendor/autoload")
^starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
