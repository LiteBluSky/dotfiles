# 1. Check if Scoop is installed, install if missing
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "=== Bootstrapping: Installing Scoop ===" -ForegroundColor Cyan
    Set-ExecutionPolicy RemoteSigned -Scope Process -Force
    IRM https://get.scoop.sh | IEX
}

# 2. Check if Nushell is installed, install if missing
if (-not (Get-Command nu -ErrorAction SilentlyContinue)) {
    Write-Host "=== Bootstrapping: Installing Nushell ===" -ForegroundColor Cyan
    scoop install shortcut  # Helpful dependency for scoop links
    scoop install nushell
}
