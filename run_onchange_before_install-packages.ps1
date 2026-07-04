Write-Host "=== Chezmoi Bootstrap: Checking App Dependencies ===" -ForegroundColor Green

Write-Host "Setting Environment Variables..." -ForegroundColor Cyan
[System.Environment]::SetEnvironmentVariable("YAZI_CONFIG_HOME", "$env:USERPROFILE\.config\yazi", "User")
[System.Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", "$env:USERPROFILE\.config", "User")
[Environment]::SetEnvironmentVariable("STARSHIP_CONFIG", "$HOME\.config\starship-styles\starship.toml", "User")

# 1. Ensure Scoop is installed
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Scoop..." -ForegroundColor Cyan
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

# 2. Add Required Buckets
Write-Host "Adding Scoop Buckets..." -ForegroundColor Cyan
scoop bucket add extras 2>$null

# 3. Consolidate Master Application Array
# Your previous Winget bundle has been cleanly translated into native Scoop names
$scoopPkgs = @(
    # Core CLI Infrastructure (From Winget)
    "nushell",
    "wezterm",
    "starship",
    "fastfetch",
    "lazygit",
    # "powershell", # Installs PowerShell 7 (Core) natively

    # Utilities & Dependencies
    "yazi", 
    "tuxedo", 
    "ffmpeg", 
    "7zip", 
    "jq", 
    "poppler", 
    "fd", 
    "ripgrep", 
    "fzf", 
    "zoxide", 
    "resvg", 
    "imagemagick",
    "vcredist2022",

    # Terminal Icons (Now handled cleanly by Scoop!)
    "terminal-icons"
)

# 4. Process Unified Clean Installation Loop
Write-Host "Processing Application Installs via Scoop..." -ForegroundColor Cyan
foreach ($pkg in $scoopPkgs) {
    if (scoop info $pkg | Select-String "Installed: version") {
        Write-Host "$pkg is already installed. Checking for updates..." -ForegroundColor DarkGray
        scoop update $pkg
    } else {
        Write-Host "$pkg not found. Installing fresh..." -ForegroundColor Yellow
        scoop install $pkg
    }
}

Write-Host "=== All applications ready! Applying settings. ===" -ForegroundColor Green
