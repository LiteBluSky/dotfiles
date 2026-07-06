# Massive's Terminal Dotfiles

Automated terminal environment configuration for Windows 11 managed by **Chezmoi**.

This repository automatically provisions your package managers (`scoop`, `winget`), installs your complete CLI toolchain, configures environment variables, and deploys your configuration maps seamlessly.

## Fast Installation

Open a standard PowerShell terminal and execute this single command:

> [!IMPORTANT]
> Make sure to set the env `home|work`.

```powershell
$env:CHEZMOI_PROFILE="<env>"; winget install twpayne.chezmoi; chezmoi init --apply LiteBluSky
```
