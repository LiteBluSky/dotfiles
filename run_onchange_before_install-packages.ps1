# Self-elevate the script if admin rights are ever required for specific winget tools

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

# 2. Install Winget Apps from README
Write-Host "Installing Winget tools..." -ForegroundColor Cyan
$wingetPkgs = @(
    "wez.wezterm",
    "starship",
    "fastfetch",
    "JesseDuffield.lazygit",
    "Microsoft.PowerShell"
)

foreach ($pkg in $wingetPkgs) {
    # Check if the package is already on the machine
    $isInstalled = winget list --id $pkg -e 2>$null
    
    if ($isInstalled) {
        Write-Host "$pkg is already installed. Checking for updates..." -ForegroundColor Cyan
        winget upgrade --id $pkg --silent --accept-source-agreements --accept-package-agreements
    } else {
        Write-Host "$pkg not found. Installing fresh..." -ForegroundColor Yellow
        winget install --id $pkg --silent --accept-source-agreements --accept-package-agreements
    }
}

# 3. Install Scoop Apps & Dependencies from README
Write-Host "Installing Scoop tools..." -ForegroundColor Cyan
scoop bucket add extras 2>$null
# scoop bucket add versions 2>$null
scoop install yazi tuxedo ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick
scoop install vcredist2022

# 4. Install Terminal-Icons
Write-Host "Installing Terminal-Icons..." -ForegroundColor Cyan
# Check if the module exists before blindly attempting to force install it
if (-not (Get-Module -ListAvailable -Name Terminal-Icons)) {
    Install-Module -Name Terminal-Icons -Repository PSGallery -Force -Scope CurrentUser
} else {
    Write-Host "Terminal-Icons already installed." -ForegroundColor DarkGray
}


# 5. Handle Required Environment Variables Natively

Write-Host "=== All applications ready! Applying settings. ===" -ForegroundColor Green
