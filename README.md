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

> [!IMPORTANT]
> You can also use this if you are already using `Nushell`
> and if the dotfiles have already been applied. Use `init --apply`
> (not `apply`) so the profile change is actually re-rendered into
> `chezmoi.toml` — plain `apply` reuses the cached config and ignores
> the env var.

```nushell
with-env { CHEZMOI_PROFILE: "work" } { chezmoi init --apply }
```
