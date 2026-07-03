# Write-Host outputs a status message during 'chezmoi apply'
Write-Host "Checking core apps..."

# Check if winget is available
if (Get-Command winget -ErrorAction SilentlyContinue) {
    
    # Install Zen Browser if it isn't already installed
    Write-Host "Installing Zen Browser via WinGet..."
    winget install -e --id Zen-Team.Zen-Browser --accept-source-agreements --accept-package-agreements

    # You can stack other apps here too!
    # winget install -e --id JanDeDobbeleer.OhMyPosh
    # winget install -e --id Git.Git

} else {
    Write-Warning "WinGet was not found on this system. Skipping application installs."
}
