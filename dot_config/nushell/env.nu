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

$env.YAZI_CONFIG_HOME = ($env.USERPROFILE | path join ".config" "yazi")
$env.XDG_CONFIG_HOME = ($env.USERPROFILE | path join ".config")
$env.EDITOR = "nvim"

# Fallback setup for Starship style configuration if unset
if not ("STARSHIP_CONFIG" in $env) {
    $env.STARSHIP_CONFIG = ($env.HOME | path join ".config" "starship-styles" "starship.toml")
}

# Starship initialization sequence (Nushell Native Autoload method)
# This creates a cached loading script inside your Nushell vendor directory
mkdir ($nu.data-dir | path join "vendor/autoload")
^starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
